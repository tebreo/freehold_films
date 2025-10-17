
import pandas as pd
import mysql.connector
from mysql.connector import errorcode

# Config - update with your credentials
config = {
  'user': 'root',
  'password': 'yourpassword',
  'host': '127.0.0.1',
  'raise_on_warnings': True
}

# Connect to MySQL
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

# Read CSVs
clients = pd.read_csv('clients_norm.csv')
films = pd.read_csv('films_norm.csv')
people = pd.read_csv('people_norm.csv')
roles = pd.read_csv('roles_norm.csv')
film_personnel = pd.read_csv('film_personnel_norm.csv')
expenses = pd.read_csv('expenses_norm.csv')

# Execute schema SQL first (or run mysql_schema.sql manually)
with open('mysql_schema.sql', 'r') as f:
    schema_sql = f.read()
for stmt in schema_sql.split(';'):
    stmt = stmt.strip()
    if stmt:
        cursor.execute(stmt)
cnx.commit()

# Insert helper
def insert_dataframe(df, table_name, cursor):
    for _, row in df.iterrows():
        cols = ','.join(row.index.astype(str))
        placeholders = ','.join(['%s'] * len(row))
        sql = f"INSERT INTO {table_name} ({cols}) VALUES ({placeholders})"
        cursor.execute(sql, tuple(None if pd.isna(x) else x for x in row.values))

insert_dataframe(clients, 'clients', cursor)
insert_dataframe(films, 'films', cursor)
insert_dataframe(people, 'people', cursor)
insert_dataframe(roles, 'roles', cursor)
insert_dataframe(film_personnel, 'film_personnel', cursor)
insert_dataframe(expenses, 'expenses', cursor)

cnx.commit()
cursor.close()
cnx.close()
print('Data loaded into MySQL successfully.')
