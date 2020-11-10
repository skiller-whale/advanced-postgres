#!/bin/python

import os

from ..utils import TableDefinition, IndexDefinition


THIS_DIR = os.path.dirname(__file__)


TABLES = [
    TableDefinition(
        "branches",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255), country_id INTEGER, company_id INTEGER)",
        os.path.join(THIS_DIR, "branches.csv")),
    TableDefinition(
        "companies",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255))",
        os.path.join(THIS_DIR, "companies.csv")),
    TableDefinition(
        "countries",
        "(id INTEGER PRIMARY KEY, code CHAR(2), name VARCHAR(255))",
        os.path.join(THIS_DIR, "countries.csv")),
    TableDefinition(
        "employee_languages",
        "(id INTEGER PRIMARY KEY, employee_id INTEGER, language_id INTEGER)",
        os.path.join(THIS_DIR, "employee_languages.csv")),
    TableDefinition(
        "employee_nationalities",
        "(id INTEGER PRIMARY KEY, employee_profile_id INTEGER, country_id INTEGER)",
        os.path.join(THIS_DIR, "employee_nationalities.csv")),
    TableDefinition(
        "employee_profiles",
        "(id INTEGER PRIMARY KEY, employee_id INTEGER, age INTEGER)",
        os.path.join(THIS_DIR, "employee_profiles.csv")),
    TableDefinition(
        "employees",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255), role_id INTEGER, home_branch_id INTEGER)",
        os.path.join(THIS_DIR, "employees.csv")),
    TableDefinition(
        "languages",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255) NOT NULL)",
        os.path.join(THIS_DIR, "languages.csv")),
    TableDefinition(
        "responsibilities",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255))",
        os.path.join(THIS_DIR, "responsibilities.csv")),
    TableDefinition(
        "role_responsibilities",
        "(id INTEGER PRIMARY KEY, role_id INTEGER, responsibility_id INTEGER)",
        os.path.join(THIS_DIR, "role_responsibilities.csv")),
    TableDefinition(
        "roles",
        "(id INTEGER PRIMARY KEY, name VARCHAR(255))",
        os.path.join(THIS_DIR, "roles.csv"))
]

INDEXES = [
    IndexDefinition(
        "branches_by_name",
        "branches",
        "name"
        ),
    IndexDefinition(
        "employees_by_name",
        "employees",
        "name",
        ),
    IndexDefinition(
        "responsibilities_by_name",
        "responsibilities",
        "LOWER(name)",
        ),
    IndexDefinition(
        "languages_by_name",
        "languages",
        "name"
        ),
]
