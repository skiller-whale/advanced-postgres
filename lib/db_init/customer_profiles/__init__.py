#!/bin/python

import csv
import os

from ..utils import TableDefinition


THIS_DIR = os.path.dirname(__file__)


TABLES = [
    TableDefinition(
        "customers",
        "(id SERIAL PRIMARY KEY, name VARCHAR(255), gender VARCHAR(255), nationality VARCHAR(255), membership_status VARCHAR(255), age INTEGER)",
        os.path.join(THIS_DIR, "customers.csv")),
    TableDefinition(
        "sales",
        "(id SERIAL PRIMARY KEY, customer_id INTEGER REFERENCES customers(id), date DATE, value NUMERIC(8,2))",
        os.path.join(THIS_DIR, "sales.csv")),
]
