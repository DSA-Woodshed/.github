# Contributing

The DSA Woodshed has two product repositories: `dsa-study-packet` owns practice
and authored content, and `dsa-woodshed.space` owns the static website. This guide
applies to both and to this organization configuration repository.

## Fork first

Create a personal fork of the org repository. Your fork is `origin`; the org is
`upstream`. Create a semantic branch, push it to your fork, and open a pull
request into upstream `main`.

```sh
gh repo fork DSA-Woodshed/<repo> --clone
cd <repo>
git remote -v
just setup
git switch -c feat/short-slug
```

For the product repositories, the maintainer forks use the `-contrib` suffix.
That preserves the redirects from their previous personal-repository locations.
Use the exact fork name shown in your remotes rather than assuming it matches
the upstream repository name.

The historical `Jesssullivan/dsa-study-packet` and
`Jesssullivan/dsa-woodshed.space` locations now redirect to organization
authority. Hooks refuse pushes to those locations as well as the org URLs.
If an old checkout still uses one as `origin`, point `origin` at your actual
personal contribution fork before pushing.

`just setup` installs contributor hooks, sets `remote.pushDefault=origin`, and
disables the upstream push URL. The hooks also run a distinct global hook layer
when one is configured. Product repositories provide pinned toolchains through
their devcontainers and Nix shells. Basic practice and public builds need no
private credentials.

## Branches

Use a short kebab-case slug with a semantic prefix: `feat/`, `fix/`, `hotfix/`,
`docs/`, `chore/`, or `ci/`. Keep fork `main` in sync with upstream before
branching. Do not force-push upstream or publish a second product from a fork.

## Commits

Use Conventional Commit subjects, such as `fix(practice): preserve candidate
edits`. Sign commits with an SSH or OpenPGP signing key registered on GitHub.
Configure `commit.gpgsign=true`; confirm that GitHub verifies the signature.

Commit as yourself. Do not add AI attribution, generated-by lines, or tool-name
prefixes to commit messages, PR titles, or descriptions. Human coauthor trailers
are welcome. The shared hooks refuse organization pushes, unsigned new commits,
and AI attribution; style and branch-name findings are warnings.

## Run the gate and paste the receipt

Use `just check` from the repository's supported environment. Include the tested
commit SHA, operating system, exact command, and result in the PR. State a
missing capability accurately; an unavailable remote executor is not a passing
execution receipt. Focused learner tests and maintainer validation are different
commands. A maintainer runs the same gate before landing when needed.

Pull requests land by squash. The title becomes the landed commit subject.
Publication is restricted to the authoritative org repositories; forks publish
neither the canonical site nor canonical packet releases.

## Personal tooling

Keep agent directives, skills, prompts, plugins, and agent notes on your personal
fork or in untracked local files. Org mains do not carry `AGENTS.md`, `CLAUDE.md`,
`.agents/`, `.claude/`, or provider-specific instruction surfaces. A personal
`agents-overlay` branch can materialize excluded files without altering product
source. Ordinary product and contributor rules belong in documentation and
executable checks that work regardless of the chosen assistant.

Personal practice state and employer-specific material remain private. See the
packet's source-of-truth contract before contributing content.

## Shared hooks

The hooks derive from the existing Great Falls Tool Bus public hook federation.
`githooks/SOURCE.json` records the pinned donor revision and DSA adaptation.
This repository publishes the adapted bytes under `githooks/`; product repos
vendor those bytes under `.githooks/` and pin the mirror revision. Change
consumer copies and run fixtures before advancing the pinned mirror revision.
Use `just hooks-test` for behavior and `just hooks-check` for byte parity.

The organization guide and mirrors introduce no Lab credentials or agent
installation requirements. Machine hooks retain their own advisory authority.
