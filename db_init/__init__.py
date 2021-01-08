import importlib
import os
import subprocess
import time

import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


# These names should match the folder names in src and db_init
DATABASES = [
    'student_scores',
    'employees',
    'employees_roles_and_branches',
]


user = os.getenv('POSTGRES_USER')
password = os.getenv('POSTGRES_PASSWORD')
host = os.getenv('POSTGRES_HOST')


def get_connection_string(database):
    return f"user={user} password={password} dbname={database} host={host}"


def get_connection(database=None, retry_time=None):
    while True:
        try:
            connection = psycopg2.connect(
                database=database,
                user=user,
                password=password,
                host=host)
            connection.autocommit = True
            return connection
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

    if hasattr(module, "INDEXES"):
        print(f"Creating indexes for: {database}")
        for index in module.INDEXES:
            index.create_index(connection)


def pg_dump(database, timeout=5):
    connection_str = get_connection_string(database)
    process = subprocess.run(
        ['pg_dump', connection_str, '-F', 't'],
        capture_output=True,
        check=True,
        timeout=timeout,
    )
    return process.stdout


def pg_restore(database, dump, timeout=5):
    connection_str = get_connection_string(database)
    process = subprocess.run(
        ['pg_restore', '-d', connection_str, '-c'],
        input=dump,
        capture_output=True,
        check=True,
        timeout=timeout,
    )
    return process.stdout


def init():
    connection = get_connection(retry_time=2)

    # Only run initialization for databases that don't already exist.
    missing_databases = set(DATABASES) - get_existing_databases(connection)
    for database in missing_databases:
        create_database(connection, database)
        build_and_seed_database(database)
