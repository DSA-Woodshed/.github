set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

setup:
    @bash -c 'source githooks/_lib.sh; woodshed_install_hooks githooks DSA-Woodshed/.github'

hooks-test:
    bash githooks/test.sh

check: hooks-test
    @git diff --check
