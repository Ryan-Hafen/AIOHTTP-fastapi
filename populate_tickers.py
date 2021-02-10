import config
import json
import psycopg2
import psycopg2.extras

connection = psycopg2.connect(host=config.dbHost, database=config.dbName, user=config.dbUser, password=config.dbPassword)

cursor = connection.cursor(cursor_factory=psycopg2.extras.DictCursor)

with open('companies.json') as f:
    companies = json.load(f)

for company in companies:
    print(f"Inserting company {company['name']} {company['symbol']}")
    cursor.execute("""
        INSERT INTO companies (symbol, name, sector, subSector, headQuarter, cik, founded, dateFirstAdded) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """, (company['symbol'], company['name'], company['sector'], company['subSector']
        , company['headQuarter'], company['cik'], company['founded'], company['dateFirstAdded']))

connection.commit()