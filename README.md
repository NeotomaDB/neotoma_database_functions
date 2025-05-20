# Neotoma Database Functions and Structures

This repository is intended to contain both unit type tests, documented functions, views and materialized views and other structural and procedural elements.

The goal of the repository is to act both as the central source of the SQL code itself (splitting from the Neotoma_SQL repository), and as a source for learning and understanding how the database itself works as we onboard users. For this reason, we are clearly defining the schema as separate folders with clear README files, and testing and validating individual functions within the context of the database and repository.

## Contributors

* Simon Goring

## How to Use This Repository

### Documenting the Database

Documentation uses [`tbls`](https://github.com/k1LoW/tbls), a powerful tool for examining databases and generating documentation. There are two scripts associated with the `tbls` installation:

* [install_tbls.sh]()
* [run_diagnostics.sh]()

These scripts will install `tbls` from GitHub, and then run the documentation and linting modules for the Neotoma database. The documentation and linting are informed by the [.tbls.yml](.tbls.yml) settings, as described on the [`tbls`](https://github.com/k1LoW/tbls) GitHub page.

