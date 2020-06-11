#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR (255));
    CREATE TABLE products (id SERIAL PRIMARY KEY, prod_name VARCHAR (255));
    INSERT INTO users ( name) VALUES ('Dave');
    INSERT INTO users ( name) VALUES ('Hywel');
    INSERT INTO products ( prod_name) VALUES ('Book');
    INSERT INTO products ( prod_name) VALUES ('House');
EOSQL
