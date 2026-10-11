# Design decisions

This file records the main decisions behind the project and why they were made. Several were confirmed with Nushell maintainers in [nushell/nushell#19206](https://github.com/nushell/nushell/issues/19206). If you want to change one, open an issue first.

Status values: **decided**, **provisional** (likely to change after more review), **open**.

---

## D1. Scope: language first, commands later

**Status:** decided

The project covers the core language: syntax, types, evaluation, scoping, pipelines and errors. Built-in commands are out of scope, except the few the language can't work without (such as `if`, `let`, `def`, `each`) and `to nuon`, which the tests use for output.

**Why:** the command set is large and still changing. A stable core command set is a separate, later question that needs the core team ([Phase 5](ROADMAP.md#phase-5-stable-core-and-10)).

## D2. Describe current behavior, don't prescribe

**Status:** decided

Tests and rules record what the current release of `nu` does. When behavior looks like a bug, it is recorded as an open question and the test is marked `pending`. The project does not decide how the language should behave.

**Why:** language design decisions belong to the Nushell maintainers. A suite that disagrees with `nu` on day one is not useful to anyone.

## D3. Target the current release

**Status:** decided (confirmed by maintainers)

Tests target the current Nushell release, recorded in `NU_VERSION`. With each new release, the version is bumped, the suite is rerun and changes are recorded.

**Why:** there is no fully defined 1.0 feature set yet, and testing against `main` would mean chasing every in-progress change.

## D4. Test format

**Status:** decided

One test per `.nu` file. Metadata lives in a comment header at the top of the file: `id`, `rule` (repeatable), `expect`, and optionally `error`, `platforms` and `status`. Expected output is written in the header between `# ---` markers. See [CONTRIBUTING.md](CONTRIBUTING.md#writing-a-test) for the exact format.

**Why:** one self-contained file is easier to review than a script plus a separate expected-output file. Because the header is made of comments, every test is still a valid Nushell script you can run by hand.

**Alternatives considered:** script + `.expected` file pairs (twice the files, easy to get out of sync); many tests per file (harder to see what failed).

## D5. Compare data, not rendering

**Status:** decided

Tests print their result with `to nuon`, and the runner compares that text. Rendered tables are never compared.

**Why:** table output depends on terminal width, theme and config, so comparing it makes tests unreliable.

**Still to settle:** how to handle float formatting, dates and record key order so they don't cause flaky tests.

## D6. Rule IDs

**Status:** decided (following the Rust Reference)

Every rule has an ID, and every test names the rule it checks. The format follows the [Rust Reference's rule conventions](https://rust-lang.github.io/reference/dev-guide/rules/index.html):

- A rule is marked with a label on its own line, `r[strings.interp.expr]`, followed by the rule text.
- IDs are lowercase, with dots separating parts from most general to most specific. Words within a part are joined with `-`. The first part is the lang guide chapter.
- `intro` and `syntax` are reserved names for a section's opening rule and for syntax described in words.
- Tests reference rules with a header line (`# rule: ...`), the equivalent of rustc's `//@ reference: ...` annotation. The line can repeat, and tests should name the most specific rule available.
- Rules don't list their tests by hand. `check.nu` derives the links, much as the Reference generates its test summary.

**Why:** IDs connect rules to tests, so coverage can be checked automatically, and they let rules move into the lang guide later without breaking the tests. Using Rust's conventions means not inventing a new scheme, and follows the model a Nushell maintainer suggested ([D11](#d11-rule-text-is-written-for-the-lang-guide)).

**Note:** like Rust's, these IDs are not stable yet and may be renamed until the rules have a permanent home.

## D7. Errors: assert specific codes

**Status:** decided (confirmed by maintainers)

Error tests state whether the error happens while parsing or while running, and the specific error code (for example `nu::parser::<code>`). The message text is not checked.

**Why:** a maintainer recommended checking specific `nu::parser` codes. They are fairly stable, but may change while the parser is being reworked. Keeping the code in a header field means it can be updated across all tests with a single search and replace.

**How:** the runner reads the code from the first `Error: nu::...` line on stderr. The phase is decided by the code: `nu::parser::...` is a parse error, anything else is a runtime error. Nushell type-checks while parsing, so many type errors count as parse errors.

## D8. Parse-only tests

**Status:** decided

Some tests only check whether code parses, without running it (`expect: parses`). The runner uses the binary's own `nu-check` command for this.

**Why:** Nushell now has two parsers (the default one and the experimental winnow parser). Parse-only tests can check both directly.

## D9. The implementation is a black box

**Status:** decided

The runner invokes a binary given by the `NU_BIN` environment variable and looks only at its output and exit code. It uses no Nushell internals.

**Why:** this is what lets the same suite check the default parser, the winnow parser, future releases or a different implementation.

**Note:** the runner is written in Nushell, so running the suite needs some `nu` binary. That binary does not have to be the one under test.

## D10. Isolated test runs

**Status:** decided

Each test runs with `--no-config-file`, in a fresh temporary directory, with no network. Platform-specific tests say so in `platforms`.

**Why:** results must not depend on the machine or the user running them.

**Still to settle:** tests currently inherit the runner's environment variables (plus `NO_COLOR=1`). A minimal fixed environment that works the same on Windows is still to be designed.

## D11. Rule text is written for the lang guide

**Status:** decided

Rule text follows the lang guide's chapters and style, so it can be added to the guide later. It is drafted here in `rules/` until the maintainers decide how they want it.

**Why:** a Nushell maintainer pointed to the Rust model, where the Reference became the source of truth and the spec grows out of it. The lang guide plays that role for Nushell, so a separate, competing specification document is avoided.

## D12. Three conformance levels

**Status:** decided

Rules are marked **defined**, **implementation-defined** or **unspecified**.

**Why:** these are the useful distinctions for a portable language. C's "undefined behavior" is deliberately left out. It implies anything can happen, which doesn't fit a safe, high-level shell.

## D13. Reuse the existing grammar

**Status:** decided

The syntax reference is the grammar from [nushell/nushell#19140](https://github.com/nushell/nushell/pull/19140) (Markdown, with BNF/EBNF planned). This project links to it at a fixed commit and does not maintain its own grammar. The link will be updated once the grammar lands and has a permanent home.

**Why:** two grammars would drift apart and undercut the point of the project.

## D14. Unofficial, separate repository

**Status:** decided

The project lives in a personal repository and says clearly that it is unofficial. It is MIT licensed, like Nushell.

**Why:** it can move quickly without reviews on every change. If the core team wants to adopt it, GitHub can transfer the repository to the nushell organization with its history intact, and the matching license makes that simple.
