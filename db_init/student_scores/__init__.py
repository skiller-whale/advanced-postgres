#!/bin/python

import csv
import os

from ..utils import TableDefinition


THIS_DIR = os.path.dirname(__file__)


TABLES = [
    TableDefinition(
        "tutors",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255))",
        os.path.join(THIS_DIR, "tutors.csv")),
    TableDefinition(
        "students",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255), tutor_id INTEGER)",
        os.path.join(THIS_DIR, "students.csv")),
    TableDefinition(
        "scores",
        "(student_id INTEGER, subject VARCHAR(255), score INTEGER, UNIQUE(student_id, subject))",
        os.path.join(THIS_DIR, "scores.csv")),
]
