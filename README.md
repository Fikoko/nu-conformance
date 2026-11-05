[![conformance](https://github.com/Fikoko/nu-conformance/actions/workflows/conformance.yml/badge.svg)](https://github.com/Fikoko/nu-conformance/actions/workflows/conformance.yml)

# nu-conformance

Conformance tests and draft specification rules for the [Nushell](https://www.nushell.sh) language.

> **Unofficial.** This is a community project. It is not affiliated with or endorsed by the Nushell core team. Discussion happens in [nushell/nushell#19206](https://github.com/nushell/nushell/issues/19206).

## What this is

Today, the only complete definition of the Nushell language is the `nu` implementation itself. This project adds two things around it:

- **Conformance tests.** Each test is a small Nushell script with its expected output or error. The tests run `nu` as a black box, so they can check the official implementation, the experimental winnow-based parser, or any future implementation.
- **Draft rules.** Precise statements of how the language behaves, each with a stable ID that tests refer to. They follow the chapters of the [Language Reference Guide](https://www.nushell.sh/lang-guide/) and are written so they could later be added to it.

## Approach, and credit to the Rust project

This project borrows its approach from the Rust project. Rust didn't write its specification as a separate document. Its [spec team](https://github.com/rust-lang/spec) decided to make the [Rust Reference](https://github.com/rust-lang/reference) the source of truth and grow the specification out of it.

Nushell follows the same idea, with the [Language Reference Guide](https://www.nushell.sh/lang-guide/) in the role of the Rust Reference. The way rules are named and linked to tests also follows the [Rust Reference's conventions](https://rust-lang.github.io/reference/dev-guide/rules/index.html). Thanks to the Rust Reference authors and the Rust spec team for working this out in the open.

## Status

The core language chapters are drafted ([Phase 2](ROADMAP.md#phase-2-core-language) is complete), and chapters on aliases, parse errors, modules and scripts were added for comparing parsers ([Phase 3](ROADMAP.md#phase-3-connecting-with-nushell)): 387 rules and 1,405 tests, all passing on Linux, macOS and Windows.

| Chapter | Rules | Tests |
|---|---:|---:|
| [Strings](rules/strings.md) | 44 | 127 |
| [Types](rules/types.md) | 90 | 309 |
| [Operators](rules/operators.md) | 45 | 160 |
| [Declarations](rules/declarations.md) | 18 | 64 |
| [Variable Scope](rules/scope.md) | 13 | 49 |
| [Flow Control](rules/flow.md) | 42 | 160 |
| [Custom Commands](rules/commands.md) | 43 | 138 |
| [Pipelines](rules/pipelines.md) | 28 | 80 |
| [Aliases](rules/aliases.md) | 14 | 69 |
| [Source Text and Parse Errors](rules/parsing.md) | 20 | 136 |
| [Modules and Overlays](rules/modules.md) | 20 | 74 |
| [Scripts](rules/scripts.md) | 10 | 39 |

Behavior that may not be intended is listed in [open-questions.md](open-questions.md). All 39 questions so far have been answered. 23 were fixed in [nushell/nushell#19271](https://github.com/nushell/nushell/pull/19271) and 4 more (A1, P1, H1, R1) in [nushell/nushell#19415](https://github.com/nushell/nushell/pull/19415), both for 0.117.0. The rest were confirmed as intended in [#1](https://github.com/Fikoko/nu-conformance/issues/1), some with documentation fixes still to make. The 79 tests for the 0.117.0 changes are marked `pending` until it is released, and each affected rule has a "Changes in 0.117.0" note. See [ROADMAP.md](ROADMAP.md) for what's next.

Tests target the **current Nushell release**, recorded in [`NU_VERSION`](NU_VERSION).

## Related work

- [Language Reference Guide](https://www.nushell.sh/lang-guide/): the human-readable reference this project builds on.
- [nushell/nushell#19140](https://github.com/nushell/nushell/pull/19140): draft PR with the winnow parser, a grammar (Markdown, with BNF/EBNF planned) and a railroad diagram. This project links to that grammar as its syntax reference rather than maintaining its own.
- [nushell/nushell#18925](https://github.com/nushell/nushell/issues/18925): the NUON specification.

## Repository layout

```
rules/        draft rule text, one file per lang guide chapter
tests/        conformance tests, one folder per chapter
lib/          shared helpers for reading tests and rules
run.nu        test runner
compare.nu    compares the default parser with an experimental one
check.nu      checks rule IDs and the links between rules and tests
NU_VERSION    the Nushell release the suite targets
open-questions.md   behavior that may not be intended
```

## Running the tests

With Nushell installed:

```nu
nu run.nu      # run the tests
nu check.nu    # check rules and test links
```

To test a different binary, set `NU_BIN`:

```nu
NU_BIN=/path/to/nu nu run.nu
```

To run the tested binary with an experimental option, pass `--option`. `compare.nu` runs the suite twice on the same binary, with and without the option, and lists every test whose result differs:

```nu
nu run.nu --option winnow-parser
NU_BIN=/path/to/winnow/nu nu compare.nu    # default parser vs winnow-parser
```

The option has to be passed this way: `nu` ignores `NU_EXPERIMENTAL_OPTIONS` when it runs a script with `--no-config-file`, as the runner does. The [winnow workflow](.github/workflows/winnow.yml) builds the winnow branch from [nushell/nushell#19140](https://github.com/nushell/nushell/pull/19140) daily and runs this comparison.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). The plan is in [ROADMAP.md](ROADMAP.md) and the reasoning behind the format is in [design-decisions.md](design-decisions.md).

## License

MIT, the same as Nushell.
