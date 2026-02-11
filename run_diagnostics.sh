#!/bin/bash
# Load environment variables
set -o allexport
set -a && source .env && set +a 
# Clean the old schema folder, run tbls
rm ./doc/schema/*
tbls doc
tbls lint > linting_output.txt
tbls out -t yaml -o schema.yaml

# Run the table exporter.
uv run database_descriptors.py