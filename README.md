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

The core language chapters are drafted ([Phase 2](ROADMAP.md#phase-2-core-language) is complete): 314 rules and 1,050 tests, all passing on Linux, macOS and Windows.

| Chapter | Rules | Tests |
|---|---:|---:|
| [Strings](rules/strings.md) | 44 | 127 |
| [Types](rules/types.md) | 90 | 309 |
| [Operators](rules/operators.md) | 45 | 160 |
| [Declarations](rules/declarations.md) | 18 | 64 |
| [Variable Scope](rules/scope.md) | 13 | 49 |
| [Flow Control](rules/flow.md) | 42 | 160 |
| [Custom Commands](rules/commands.md) | 43 | 138 |
| [Pipelines](rules/pipelines.md) | 19 | 43 |

Behavior that may not be intended is listed in [open-questions.md](open-questions.md). 23 of the questions, and parts of two more, were fixed in [nushell/nushell#19271](https://github.com/nushell/nushell/pull/19271) for 0.117.0. The 62 tests for those changes are marked `pending` until 0.117.0 is released, and each affected rule has a "Changes in 0.117.0" note. See [ROADMAP.md](ROADMAP.md) for what's next.

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

To test a different binary, such as a build with the winnow parser, set `NU_BIN`:

```nu
NU_BIN=/path/to/nu nu run.nu
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). The plan is in [ROADMAP.md](ROADMAP.md) and the reasoning behind the format is in [design-decisions.md](design-decisions.md).

## License

MIT, the same as Nushell.
