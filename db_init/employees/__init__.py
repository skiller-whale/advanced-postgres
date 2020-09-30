#!/bin/python

import csv
import os

from ..utils import TableDefinition


THIS_DIR = os.path.dirname(__file__)


TABLES = [
    TableDefinition(
        "employees",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255), manager_id INTEGER, salary INTEGER)",
        os.path.join(THIS_DIR, "employees.csv")),
    TableDefinition(
        "projects",
        "(id INTEGER PRIMARY KEY, owner_id INTEGER, budget INTEGER, parent_project_id INTEGER)",
        os.path.join(THIS_DIR, "projects.csv")),
]
