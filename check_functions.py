#! /usr/bin/python3

"""
Neotoma DB Function Checker

Simon Goring
2024 MIT License

Connect to a Neotoma Paleoecology Database and check the function definitions against local version, remote versions or versions stored within the remote .git store.
"""

from dotenv import load_dotenv
import ndbfunctions
import psycopg
import json
import os

load_dotenv()
data = os.getenv('DBAUTH')
print(data)
conn = psycopg.connect(conninfo=data, connect_timeout = 5)

# _ = ndbfunctions.call_functions(conn)
_ = ndbfunctions.call_tables(conn)