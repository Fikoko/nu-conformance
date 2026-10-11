# Contributing

Thanks for helping. This project is small and early, so the process is simple.

## Ground rules

1. **Describe what `nu` does, don't decide what it should do.** Tests record the behavior of the current Nushell release. If behavior looks wrong or inconsistent, don't change the expected result to what you think is right. Open an issue labelled `open-question` and mark the test `status: pending`.
2. **One behavior per test.** A test that checks one thing is easy to review, and when it fails you know exactly what changed.
3. **Every test points to a rule.** If no rule exists yet, add one in `rules/` in the same pull request.
4. **Keep the lang guide in sync.** If you find an example in the [Language Reference Guide](https://www.nushell.sh/lang-guide/) that no longer matches `nu`, fix it upstream in [nushell/nushell.github.io](https://github.com/nushell/nushell.github.io) and link that PR in yours.

## Writing a test

Tests live in `tests/<chapter>/`, one file per test, named after the test's ID.

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
| `rule`      | yes      | The rule ID this test checks. |
| `expect`    | yes      | `output`, `parse-error` or `runtime-error`. |
| `error`     | for errors | The expected error code, e.g. `nu::parser::<code>`. |
| `platforms` | no       | `all` (default), or a list like `linux, macos`. |
| `status`    | no       | `active` (default) or `pending`. |

For `expect: output`, the expected output goes between the two `# ---` lines, one `# ` prefix per line. Leave the block out for error tests.

Things to get right:

- **Print data, not tables.** End the script with `| to nuon`. Rendered tables depend on terminal width and theme, so they make tests unreliable.
- **Error tests check the code, not the message.** Messages are worded for people and change freely. Codes are more stable, though they may still change while the parser is being reworked.
- **No network, no absolute paths, no reliance on your config.** The runner uses `--no-config-file` and a clean temporary directory.

See [design-decisions.md](design-decisions.md) for why the format works this way.

## Writing a rule

Rules live in `rules/<chapter>.md`, following the chapters of the lang guide. Each rule has an ID, a level and a short, precise statement:

```markdown
### strings.interp.expr

**Level:** defined

Inside an interpolated string, a parenthesized expression is evaluated and its value is converted to a string in place.

Tests: `strings.interp.nested-expr`
```

The level is one of:

- **defined**: every conforming implementation must behave this way.
- **implementation-defined**: implementations may differ, but each must document what it does.
- **unspecified**: implementations may differ and need not document it.

The rule ID format is provisional until it has been checked against the Rust Reference's conventions. See [design-decisions.md](design-decisions.md#d6-rule-ids).

## Before opening a pull request

- Run the suite against the pinned release (`NU_BIN=... nu run.nu`) once the runner exists.
- Check that each new test's `id` matches its file name and its `rule` exists.
- Keep pull requests to one chapter or one topic.

## Questions

Open an issue here for anything about this project. Broader questions about the language itself belong in [nushell/nushell#19206](https://github.com/nushell/nushell/issues/19206) or the Nushell Discord.
