set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

setup:
    git config core.hooksPath githooks
    git config remote.pushDefault origin
    if git remote get-url upstream >/dev/null 2>&1; then git remote set-url --push upstream DISABLED-fork-first; fi

hooks-test:
    bash githooks/test.sh

check: hooks-test
    @git diff --check
