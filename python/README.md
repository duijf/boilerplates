# Python

Boilerplate for a Python codebase.

## Commands

```
# Get a development shell. Using $SHELL means you get your default
# shell configuration. (By default, bash is started).
$ ./bin/dev-shell.sh

# Run the program
$ python -m my_module

# Documentation server
$ ./bin/docs.py

# Generate documentation
$ ./bin/docs.py --build

# Run the test suite
$ ./bin/test.sh

# Run pre-commit lints and checks
$ ./bin/pre-commit.py

# Install pre-commit lints and checks
$ ./bin/pre-commit.py --install
```

## Features

Lints:

 - Autoformatting with `black`.
 - Import sorting with `isort`.
 - Type checking with `mypy --strict`.
 - PEP8 compliance with `flake8`.

Python:

 - Dependency management with Nix and Nixpkgs' Python infrastructure.
 - Test suite with hypothesis.

## How to use

 - Copy over the files to the new project.
 - Potentially: update the Nixpkgs snapshot.
 - Rename `my_module` to something else and get coding.
