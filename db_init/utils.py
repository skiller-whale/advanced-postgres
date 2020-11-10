import csv

from psycopg2 import sql


class TableDefinition:
    def __init__(self, name, definition, data_csv=None):
        self.name = name
        self.definition = definition
        self.data_csv = data_csv

    def create_table(self, connection):
        with connection.cursor() as cursor:
            cursor.execute(
                sql.SQL("CREATE TABLE {name} {definition};").format(
                    name=sql.Identifier(self.name),
                    definition=sql.SQL(self.definition),
                )
            )
        connection.commit()

    def seed_table(self, connection):
        if not self.data_csv:
            return

        with connection.cursor() as cursor, \
             open(self.data_csv) as csv_file:

            reader = csv.DictReader(csv_file)
            for row in reader:
                keys, values = zip(*row.items())
                values = [x if x != '' else None for x in values]

                placeholders = sql.SQL(', ').join(sql.Placeholder() * len(keys))
                columns = sql.SQL(', ').join(map(sql.Identifier, keys))

                cursor.execute(
                    sql.SQL(
                      "INSERT INTO {table} ({columns}) VALUES({placeholders});"
                    ).format(
                        table=sql.Identifier(self.name),
                        columns=columns,
                        placeholders=placeholders,
                    ),
                    values
                )
        connection.commit()


class IndexDefinition:
    def __init__(self, name, table, columns, predicate=None, index_type=None):
        self.name = name
        self.table = table
        self.columns = columns
        self.predicate = predicate
        self.index_type = index_type

    def create_index(self, connection):
        query = sql.SQL("CREATE INDEX {name} ON {table}").format(
            name=sql.Identifier(self.name),
            table=sql.Identifier(self.table),
        )
        if self.index_type:
            query = sql.SQL("{query} USING {index_type}").format(
                query=query,
                index_type=sql.SQL(self.index_type)
            )
        query = sql.SQL("{query} ({columns})").format(
            query=query,
            columns=sql.SQL(self.columns)
        )
        if self.predicate:
            query = sql.SQL("{query} WHERE {predicate}").format(
                query=query,
                predicate=sql.SQL(self.predicate)
            )
        query = sql.SQL("{query};").format(query=query)

        with connection.cursor() as cursor:
            cursor.execute(query)
        connection.commit()
