# Contributing

Thanks for helping. This project is small and early, so the process is simple.

## Ground rules

1. **Describe what `nu` does, don't decide what it should do.** Tests record the behavior of the release in `NU_VERSION`, even when it looks wrong. If behavior looks wrong or inconsistent, keep the test active with the current result, add an **Open question** paragraph under its rule, and add the question to [`open-questions.md`](open-questions.md).
2. **One behavior per test.** A test that checks one thing is easy to review, and when it fails you know exactly what changed.
3. **Every test points to a rule.** If no rule exists yet, add one in `rules/` in the same pull request.
4. **Keep the lang guide in sync.** If you find an example in the [Language Reference Guide](https://www.nushell.sh/lang-guide/) that no longer matches `nu`, fix it upstream in [nushell/nushell.github.io](https://github.com/nushell/nushell.github.io) and link that PR in yours.

## Running the checks

```nu
nu run.nu                  # run all tests against the nu running the script
nu run.nu interp           # only tests whose ID contains "interp"
nu run.nu --verbose        # also list passing and skipped tests
NU_BIN=/path/to/nu nu run.nu   # test a different binary
nu check.nu                # check rule IDs and links between rules and tests
nu check.nu --list-untested
```

`run.nu` warns if the binary under test isn't the version in `NU_VERSION`. Both scripts exit with a non-zero code on failure, and CI runs them on Linux, macOS and Windows.

## Writing a test

Tests live in `tests/<chapter>/`, one file per test. The file name is the test ID plus `.nu`.

A test is a Nushell script with a header in comments:

```nu
# id: strings.interp.nested-expr
# rule: strings.interp.expr
# expect: output
# ---
# "value: 4"
# ---
let x = 3
$"value: ($x + 1)" | to nuon
```

The header fields are:

| Field       | Required | Meaning |
|-------------|----------|---------|
| `id`        | yes      | Unique test ID. Must match the file name. |
| `rule`      | yes      | The rule this test checks. Repeat the line if a test covers more than one rule. |
| `expect`    | yes      | `output`, `parse-error`, `compile-error`, `runtime-error` or `parses`. |
| `error`     | no       | For error tests: the exact error code, e.g. `nu::parser::unclosed_delimiter`. |
| `platforms` | no       | `all` (default), or a comma-separated list of `linux`, `macos`, `windows`. |
| `status`    | no       | `active` (default) or `pending`. |

What each `expect` value checks:

- **`output`**: the script succeeds and its output matches the block between the two `# ---` lines (one `# ` prefix per line). Trailing newlines and Windows line endings are ignored.
- **`parse-error`**: the script fails with an error code starting with `nu::parser::`. If `error` is given, the code must match it exactly.
- **`compile-error`**: the script fails with an error code starting with `nu::compile::`. These errors come after parsing but before anything runs, so `nu-check` still reports the code as valid. If `error` is given, it must match exactly.
- **`runtime-error`**: the script fails with an error code that starts with neither `nu::parser::` nor `nu::compile::` (usually `nu::shell::...`). If `error` is given, it must match exactly.
- **`parses`**: the code parses without errors. It is not run. This uses `nu-check`.

`status: pending` is for tests whose expected result has been decided by the maintainers but isn't in a release yet. Pending tests are run and reported, but never fail the suite. When a pending test starts passing, the runner tells you to mark it active.

Things to get right:

- **Print data, not tables.** End the script with `| to nuon`. Rendered tables depend on terminal width and theme, so they make tests unreliable.
- **Use bytes for invisible characters.** `to nuon` writes newlines and control characters as they are, which makes expected output hard to read. For those, compare bytes instead: `"a\nb" | into binary | to nuon` gives `0x[610A62]`.
- **Only the last value is printed.** A script's output is the value of its last pipeline. To check more than one value, `print` the earlier ones: `print (1 | to nuon)`.
- **Error tests check the code, not the message.** Messages are worded for people and change freely. Codes are more stable, though they may still change while the parser is being reworked.
- **Some errors happen earlier than you'd expect.** Nushell checks types while parsing, so many type errors are parse errors (`nu::parser::...`), not runtime errors. Run the script and look at the code before choosing `expect`.
- **No network, no absolute paths, no reliance on your config.** Each test runs with `--no-config-file` in a fresh temporary directory.
- **Commands that don't exist.** To test what happens when a command isn't found, use a name that starts with `nu-conformance-`, so it can't clash with a real program. Don't rely on case to make a name unique: macOS and Windows find commands regardless of case, so `True` runs the system's `true` program there.
- **The header documents the first `def`.** Comments directly above a `def` become its documentation, and the test header is a comment block. If the first line of a test is a `def`, its help text starts with the header. Put another line first, or don't test the exact help text.
- **Credit the source.** A test taken from an example in the lang guide or the Book ends its ID with `-guide` or `-book`, so it's clear which documented examples are covered.

See [design-decisions.md](design-decisions.md) for why the format works this way.

## Writing a rule

Rules live in `rules/<chapter>.md`, one file per lang guide chapter. Each rule is one paragraph on a single line. It starts with the rule's level in bold and ends with its label, in code style, so the label doesn't get in the way of reading:

```markdown
**Defined.** In an interpolated string (`$"..."`), an expression in parentheses is evaluated and its value replaces the parentheses. `[strings.interp.expr]`
```

Extra paragraphs, such as an **Open question**, go on the following lines without a label.

The level is one of:

- **Defined**: every conforming implementation must behave this way.
- **Implementation-defined**: implementations may differ, but each must document what it does.
- **Unspecified**: implementations may differ and need not document it.

You don't list a rule's tests next to it. `check.nu` works that out from the tests' headers.

### Naming rules

These naming conventions follow the [Rust Reference](https://rust-lang.github.io/reference/dev-guide/rules/index.html):

- Lowercase, with dots separating parts from most general to most specific: `strings.double-quoted.escapes`.
- The first part is the lang guide chapter: `strings`, `types`, `operators` and so on.
- Use `-` between words within a part. When a part names something from the language that contains `_`, keep the `_`.
- Don't repeat earlier parts: `strings.raw.delimiters`, not `strings.raw.raw-string-delimiters`.
- Use `intro` for the opening rule of a section, and `syntax` for a rule that describes syntax in words.
- One rule covers one idea. Purely explanatory text doesn't need a rule.
- Tests name the most specific rule available: `strings.interp.expr`, not `strings.interp`. `check.nu` warns otherwise.

Rule IDs are not stable yet and may be renamed while the project is young. That will change once the rules have a permanent home.

## Test naming

Test IDs follow the same style, starting with the chapter, and describe the case: `strings.double-quoted.unclosed`, `strings.raw.inner-single-quote`. A test ID can be the same as the ID of the rule it checks, though it usually describes a narrower case.

## Before opening a pull request

- Run `nu run.nu` and `nu check.nu` against the version in `NU_VERSION`, and make sure both pass.
- Keep pull requests to one chapter or one topic.

## Questions

Open an issue here for anything about this project. Broader questions about the language itself belong in [nushell/nushell#19206](https://github.com/nushell/nushell/issues/19206) or the Nushell Discord.
