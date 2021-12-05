# Haskell CLI

Boilerplate for a Haskell CLI application.

## Commands

```
# Get a development shell. Using $SHELL means you get your default
# shell configuration. (By default, bash is started).
$ nix-shell --command $SHELL

# Alternatively, for direnv users: whitelist the .envrc file in this
# directory
$ direnv allow

# Build the project (development)
$ cabal build

# Build the project (release, enables -Werror)
# NB: be careful, this might use cached build results from
# dist-newstyle so you might not actually get a failed build
# while you'd expect one.
$ cabal build -f release

# Running the program
$ cabal run -- cli --string foo --number 5
Config {number = 5, string = "foo"}

# Run the test suite
$ cabal test
```

## Features

Cabal and Nix:

 - Dependency management with Nix and Nixpkgs' Haskell infrastructure.
 - Sane set of extra warnings.
 - Relatively small set of default language extensions.
 - Deduplicated cabal file with import stanzas.

Haskell:

 - CLI parsing with `options-generic`
 - Test suite with `hspec` and `hspec-discover`

## How to use

 - Copy over the files to the new project.
 - Potentially: update the Nixpkgs snapshot.
 - Rename cabal file and change `name`, `author`, and `maintainer`.
 - Change config data type as you see fit, implement features and tests.
