# nu-conformance

Conformance tests and draft specification rules for the [Nushell](https://www.nushell.sh) language.

> **Unofficial.** This is a community project. It is not affiliated with or endorsed by the Nushell core team. Discussion happens in [nushell/nushell#19206](https://github.com/nushell/nushell/issues/19206).

## What this is

Today, the only complete definition of the Nushell language is the `nu` implementation itself. This project adds two things around it:

- **Conformance tests.** Each test is a small Nushell script with its expected output or error. The tests run `nu` as a black box, so they can check the official implementation, the experimental winnow-based parser, or any future implementation.
- **Draft rules.** Precise statements of how the language behaves, each with a stable ID that tests refer to. They follow the chapters of the [Language Reference Guide](https://www.nushell.sh/lang-guide/) and are written so they could later be added to it.

The approach follows the Rust project, where the [Rust Reference](https://github.com/rust-lang/reference) became the source of truth and the specification is growing out of it.

## Status

Early. The test format, runner, coverage check and CI are in place ([Phase 0](ROADMAP.md#phase-0-foundations)). The first chapter, Strings, has a handful of seed tests and is next ([Phase 1](ROADMAP.md#phase-1-pilot-with-the-strings-chapter)).

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
