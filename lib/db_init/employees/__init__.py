#!/bin/python

import csv
import os

from ..utils import TableDefinition


THIS_DIR = os.path.dirname(__file__)


TABLES = [
    TableDefinition(
        "employees",
        "(id SERIAL PRIMARY KEY, name VARCHAR(255), manager_id INTEGER REFERENCES employees(id), salary INTEGER)",
        os.path.join(THIS_DIR, "employees.csv")),
    TableDefinition(
        "projects",
        "(id SERIAL PRIMARY KEY, owner_id INTEGER REFERENCES employees(id), budget INTEGER, parent_project_id INTEGER REFERENCES projects(id))",
        os.path.join(THIS_DIR, "projects.csv")),
]
