#!/bin/bash
# Load environment variables
set -o allexport
source .env set
+o allexport
# Clean the old schema folder, run tbls
rm ./doc/schema/*
tbls doc
tbls lint > linting_output.txt
tbls out -t yaml -o schema.yaml
