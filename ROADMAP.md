# Roadmap

Work is split into phases. Each phase ends with something concrete to show the Nushell maintainers, so the plan can change based on their feedback. Later phases are kept vague on purpose.

## Phase 0: Foundations

Settle the format and build the tools before writing many tests.

- [x] Review how the Rust Reference handles rule identifiers and links to tests
- [x] Settle the rule ID format ([D6](design-decisions.md#d6-rule-ids))
- [x] Settle the test format ([D4](design-decisions.md#d4-test-format))
- [x] Write `run.nu`: reads `NU_BIN`, runs each test in isolation, reports pass / fail / pending
- [x] Add `NU_VERSION` with the pinned release
- [x] Set up CI on Linux, macOS and Windows against the pinned release
- [x] Write the coverage check (`check.nu`): rules without tests, tests pointing to missing rules
- [x] Confirm CI passes on all three platforms
- [ ] Decide how to give tests a minimal fixed environment ([D10](design-decisions.md#d10-isolated-test-runs))

## Phase 1: Pilot with the Strings chapter

Prove the approach on one chapter of the lang guide.

- [x] Turn every string-literal example in the lang guide's Strings chapter, and the Book page it points to, into a test
- [x] Add edge cases: escapes, interpolation, raw strings, backtick strings, bare words, unterminated strings
- [x] Draft the rule text in `rules/strings.md`
- [x] Record unclear or inconsistent behavior in `open-questions.md`
- [ ] Send small fixes upstream where the guide or the Book is inaccurate
- [ ] Check CI passes on all three platforms with the new tests

**Milestone:** post the repo in [nushell/nushell#19206](https://github.com/nushell/nushell/issues/19206) and ask whether the rule format would work inside the lang guide.

## Phase 2: Core language

Same process as the pilot, chapter by chapter, in roughly this order:

1. Basic types and literals
   - [x] Integers, floats, booleans, null
   - [x] Durations, filesizes, dates, ranges, binary
   - [x] Lists, records, tables
2. Operators
   - [x] Arithmetic, comparison, bitwise, boolean, precedence
   - [ ] String, membership and regex operators, assignment, spread
3. Declarations and variable scope
4. Flow control
5. Custom commands
6. Pipelines and `$in`

## Phase 3: Connecting with Nushell

- Run the suite against `nu --experimental-options winnow-parser` in CI, next to the default parser. Any difference is a bug in one of them.
- Move rule text into the lang guide through pull requests, if the maintainers agree.
- Propose running the suite in Nushell's own CI once it is stable.

## Phase 4: Harder areas

Platform-dependent behavior, left until the foundations are solid:

- Runtime errors and how they propagate
- External commands and argument passing, especially on Windows
- Environment variables and their scope
- A catalog of implementation-defined and platform-specific behavior

## Phase 5: Stable core and 1.0

Only together with the core team:

- Which commands form a stable core set (see [nushell/nushell#12768](https://github.com/nushell/nushell/issues/12768))
- How the suite supports the 1.0 promise that scripts keep working

## Ongoing

- **New releases:** bump `NU_VERSION`, rerun, and record what changed.
- **Coverage:** keep the rules-without-tests list short.
- **Scope:** finish chapters fully before starting new ones.
