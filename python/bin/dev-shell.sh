#!/usr/bin/env bash

# Launch a development shell.
#
#  - Find out the root of the repository relative to this file and makes
#    it available under $PROJECT_ROOT. (This is nice for any scripts, they
#    don't have to duplicate a bunch of logic.)
#  - Change directory to $PROJECT_ROOT.
#  - Launch the Nix dev environment in your default shell.

set -eufo pipefail

# NB: Does not follow symlinks.
export PROJECT_ROOT="$(realpath "$(dirname "$0")/..")"

cd "$PROJECT_ROOT"
nix-shell --command $SHELL
