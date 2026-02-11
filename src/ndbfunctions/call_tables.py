import psycopg
from pathlib import Path

def call_tables(con:psycopg.Connection, 
                  schema:list = ["ap", "cron", "da", "db", "doi", "ecg", "emb", "gen", "ndb", "ti", "tmp", "ts"]) -> None:
    """_Write database table descriptions from the remote server._
    This function is intended to call out to the Neotoma server and then return fully described statements
    to add full table descriptions, comments, triggers and constraints for tables.

    Args:
        con (psycopg2.Connection): _description_
        schema (list, optional): _description_. Defaults to ["ap", "cron", "da", "db", "doi", "ecg", "emb", "gen", "ndb", "ti", "tmp", "ts"].

    Returns:
        _None_: _The output is written to file, rather than to a data object._
    """    
    TABLES = """
        SELECT table_schema AS schema, table_name AS table FROM information_schema.tables 
        WHERE table_schema = ANY(%(schema)s)
        AND table_type = 'BASE TABLE'
        ORDER BY table_schema, table_name;"""
    
    QUERY = """SELECT * FROM wmv_get_table_definition(%(schema)s, %(table)s);"""
    
    try:
        written = []
        with con.cursor() as cur:
            cur.execute(TABLES, {'schema': schema})
            tables = cur.fetchall()
            for record in tables:
                print(record)
                _ = cur.execute(QUERY, {'schema': record[0], 'table': record[1]})
                outcome = cur.fetchone()
                output_file = Path(f"./database/{con.info.dbname}/tables/{record[0]}/{record[1]}.sql")
                output_file.parent.mkdir(exist_ok=True, parents=True)
                with open(output_file, 'w', encoding='UTF-8') as f:
                    f.write(outcome[0])
                    written.append(list(record[:-2]))
                    result = {'status': 'success',
                            'written': written}
    except Exception as e:
        result = {'status': 'failture',
                  'written': None,
                  'error': e}
    return result
