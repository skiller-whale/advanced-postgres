#!/bin/python

import csv
import os

from ..utils import TableDefinition


THIS_DIR = os.path.dirname(__file__)


TABLES = [
    TableDefinition(
        "projects",
        "(id SERIAL PRIMARY KEY, budget INTEGER, reference VARCHAR(255))",
        os.path.join(THIS_DIR, "projects.csv")),
    TableDefinition(
        "categories",
        "(id SERIAL PRIMARY KEY, label VARCHAR(255))",
        os.path.join(THIS_DIR, "categories.csv")),
    TableDefinition(
        "work_items",
        "(id SERIAL PRIMARY KEY, parent_work_item_id INTEGER REFERENCES work_items(id), project_reference VARCHAR(255), status VARCHAR(255), created_on TIMESTAMP, category_id INTEGER REFERENCES categories(id))",
        os.path.join(THIS_DIR, "work_items.csv")),
    TableDefinition(
        "documents",
        "(id SERIAL PRIMARY KEY, project_reference VARCHAR(255), identifier VARCHAR(255), version INTEGER, created_on TIMESTAMP, category_id INTEGER REFERENCES categories(id), active BOOLEAN)",
        os.path.join(THIS_DIR, "documents.csv")),
]
