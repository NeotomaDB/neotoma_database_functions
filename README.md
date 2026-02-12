# Neotoma Database Functions and Structures

This repository is intended to contain both unit type tests, documented functions, views and materialized views and other structural and procedural elements.

The goal of the repository is to act both as the central source of the SQL code itself (splitting from the Neotoma_SQL repository), and as a source for learning and understanding how the database itself works as we onboard users. For this reason, we are clearly defining the schema as separate folders with clear README files, and testing and validating individual functions within the context of the database and repository.

## Contributors

* Simon Goring

## How to Use This Repository

All of the linting and export scripts can be un with `run_diagnostics.sh`.

### Linting the Database

Documentation uses [`tbls`](https://github.com/k1LoW/tbls), a powerful tool for examining databases and generating documentation. There are two scripts associated with the `tbls` installation:

* [install_tbls.sh](install_tbls.sh)
* [run_diagnostics.sh](run_diagnostics.sh)

These scripts will install `tbls` from GitHub, and then run the documentation and linting modules for the Neotoma database. The documentation and linting are informed by the [.tbls.yml](.tbls.yml) settings, as described on the [`tbls`](https://github.com/k1LoW/tbls) GitHub page.

#### Understanding the Linting Output

Once `tbls` has been run, a file `linting_output.txt.` will be generated. This file will indicate all potential issues of note within the database. **Note**: This is a very extensive list of issues, but ultimately the list is critical, for example:

* Column level comments ensure that the database itself is self-documenting.
* Absence of `recdatecreated` and `recdatemodified` columns indicates that we are not properly tracking changes to the database tables.
* Missing foreign key indexes mean query performance may be degraded.

More details about the meaning and correction of the `tbls` linting warnings are available from the `tbls` documentation.

### Database Tables, Views and Functions

The folder `database` contains definitions for all (non-system) tables in Neotoma, in each of the main `neotoma` database and the `neotomatank` database (where there may be differences during development). These definitions are generated using the [`database_descriptor.py`](database_descriptor.py) script. The script calls to the database and creates a unique file for each database function and table in each schema. The core element of the script is the `public.wmv_get_table_definition()` database function. This function is fully described in a [GitHub Gist](https://gist.github.com/SimonGoring/b7529a476d7febeb26ebf83c5c18f8ba).

#### Tables

For each table, we provide the table definition as a `CREATE TABLE IF NOT EXISTS` statement. This statement lists all columns in each table, and lists the variable types. We include the `COMMENT` statements for the tables, so that these can be added (if needed) or modified, particularly in response to the results of the database linting (above).

Table files also include calls to add table constraints, indices and foreign keys. The intention of these files is to support the ability to sync between the repository and the database itself. Although the syncing has not yet been fully implemented, it will likely include a reporting and logging feature that uses an md5 hashing approach and some form of conflict detection.

#### Functions

For each function in each of the Neotoma database schema, we define the function using a `CREATE OR REPLACE FUNCTION` statement, so that the files can be run individually to create, or to overwrite the existing function.

For functions where the function `return` object may change (different column names, or definitions), it is possible the user may first need to `DELETE` the function properly, rather than just running `CREATE OR REPLACE`.

