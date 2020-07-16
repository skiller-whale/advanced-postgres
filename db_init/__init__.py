import importlib
import os
import time

import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


# These names should match the folder names in src and db_init
DATABASES = [
    'window_functions'
]


def get_connection(database=None, retry_time=None):
    while True:
        try:
            return psycopg2.connect(
                database=database,
                user=os.getenv('POSTGRES_USER'),
                password=os.getenv('POSTGRES_PASSWORD'),
                host=os.getenv('POSTGRES_HOST'))
        except psycopg2.OperationalError:
            db_name = "postgres" if database is None else f'database: {database}'
            if retry_time is None:
                print(f"Couldn't connect to {db_name}")
                break  # Exit the while True loop
            print(f"Couldn't connect to {db_name}, retrying in {retry_time}s")
            time.sleep(retry_time)


def get_existing_databases(connection):
    with connection.cursor() as cursor:
        cursor.execute(sql.SQL('SELECT datname FROM pg_database'))
        return {result[0] for result in cursor.fetchall()}


def create_database(connection, database):
    with connection.cursor() as cursor:
        print(f"Creating database {database}")
        command = sql.SQL('CREATE DATABASE {}').format(sql.Identifier(database))
        cursor.execute(command)


def build_and_seed_database(database):
    connection = get_connection(database, retry_time=2)
    # Import the module at db_init/<database> and use its TABLE definitions
    module = importlib.import_module(f'.{database}', 'db_init')

    print(f"Building database: {database}")
    for table in module.TABLES:
        table.create_table(connection)

    print(f"Seeding database: {database}")
    for table in module.TABLES:
        table.seed_table(connection)


def init():
    connection = get_connection(retry_time=2)
    connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

    # Only run initialization for databases that don't already exist.
    missing_databases = set(DATABASES) - get_existing_databases(connection)
    for database in missing_databases:
        create_database(connection, database)
        build_and_seed_database(database)
