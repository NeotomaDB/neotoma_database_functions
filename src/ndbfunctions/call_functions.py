import psycopg
from pathlib import Path

def call_functions(con:psycopg.Connection, 
                  schema:list = ["ap", "cron", "da", "db", "doi", "ecg", "emb", "gen", "ndb", "ti", "tmp", "ts"]) -> None:
    """_Write database functions from the remote server._
    This function 

    Args:
        con (psycopg2.Connection): _description_
        schema (list, optional): _description_. Defaults to ["ap", "cron", "da", "db", "doi", "ecg", "emb", "gen", "public", "ndb", "ti", "tmp", "ts"].

    Returns:
        _type_: _description_
    """    
    QUERY = """
        SELECT n.nspname AS schema,
                 proname AS functionName,
               pg_get_function_identity_arguments(f.oid) AS args,
               pg_get_functiondef(f.oid) AS function
        FROM            pg_catalog.pg_proc AS f
        INNER JOIN pg_catalog.pg_namespace AS n ON f.pronamespace = n.oid
        WHERE
            n.nspname = ANY(%(schema)s)
        ORDER BY n.nspname, proname"""
    
    try:
        written = []
        with con.cursor() as cur:
            cur.execute(QUERY, {'schema': schema})
            for record in cur:
                print(record)
                schema = record[0]
                filename = record[1] + '.sql'
                output_file = Path(f"./database/{con.info.dbname}/functions/{schema}/{filename}")
                output_file.parent.mkdir(exist_ok=True, parents=True)
                with open(output_file, 'w', encoding='UTF-8') as f:
                    f.write(record[3])
                    written.append(list(record[:-2]))
        result = {'status': 'success',
                  'written': written}
    except Exception as e:
        result = {'status': 'failture',
                  'written': None,
                  'error': e}
    return result
