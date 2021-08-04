# Python

Boilerplate for a Python codebase with FastAPI.

 - FastAPI powered application server.
 - PostgreSQL database with `asyncpg`. Project specific (no global postgres DB
   / state to manage).
 - Overmind to run all applications.

Not all of this is production quality (e.g. the migration system is a bit ad
hoc). It does show you how you can set up a pretty OK development environment
with Nix and direnv.

## Dependencies

 - Nix
 - direnv

## Commands

```
# Run direnv allow to automatically load a development shell
# when `cd`ing to the current directory.
$ direnv allow

# Run the webapi + DB server.
$ start

# Run pre-commit lints and checks
$ pre-commit

# Install pre-commit lints and checks
$ pre-commit --install
```

## Features

Lints:

 - Autoformatting with `black`.
 - Import sorting with `isort`.
 - Type checking with `mypy --strict`.
 - PEP8 compliance with `flake8`.

Python:

 - Dependency management with Nix and Nixpkgs' Python infrastructure.

## How to use

 - Copy over the files to the new project.
 - Potentially: update the Nixpkgs snapshot.
