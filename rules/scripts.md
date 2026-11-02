# Scripts: `source` and `run`

Draft rules for running one script from another with `source` and `run`. The lang guide has no chapter on these yet, so they follow the Book's [Scripts](https://www.nushell.sh/book/scripts.html) page.

**Checked against:** Nushell 0.116.1.

Every test is itself a script run with `nu`, which matters for `main`: when a script defines a command named `main`, `nu` calls it after running the script. The files the tests source or run are kept in a folder next to each test (see [CONTRIBUTING.md](../CONTRIBUTING.md)). Paragraphs marked **Open question** describe current behavior that may not be intended, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** `source` and `run` are parser keywords: the file is read while the calling script is parsed. The file name must be a constant, either a literal or a `const` variable. A `let` variable is a parse error, `nu::parser::error`. A file that doesn't exist is a parse error, `nu::parser::sourced_file_not_found`. With `null` as the file name, they do nothing. `[scripts.files]`

## `source`

**Defined.** `source file` runs the file in the current scope, as if its text were written in place of the `source` statement. Its commands, variables and environment changes are available after it, but not before. Its last value is the value of the `source` statement. `[scripts.source.scope]`

**Defined.** A `source` inside a block makes the file's definitions available only in that block. A sourced file can itself use `source`. `[scripts.source.nested]`

**Defined.** A syntax error in a sourced file is a parse error in the script that sources it, and nothing runs. `[scripts.source.errors]`

**Defined.** A `main` command defined in a sourced file becomes the sourcing script's `main`, so `nu` calls it after running the script. `[scripts.source.main]`

## `run`

**Defined.** `run file` runs a script as one stage of a pipeline. A script without `main` is evaluated as a whole, with the pipeline input as `$in`, and its last value is passed on. `[scripts.run.plain]`

**Defined.** If the script defines `main`, `run` calls it with the pipeline input and with the arguments and flags given after the file name. `[scripts.run.main]`

**Defined.** Variables and environment changes made by the script, including `cd`, don't carry over to the caller. `[scripts.run.isolation]`

**Defined.** The commands the script defines, including `main`, stay defined in the caller's scope after a `run` statement, though not after a `run` inside a subexpression. In a script, a `main` that came from `run` is then called by `nu` when the script ends, without arguments, and its output follows the script's own. `[scripts.run.definitions]`

**Open question:** the Book says the script "runs in its own scope", but its commands leak into the caller. A leaked `main` runs a second time when the calling script ends, and fails if it has required parameters.

**Defined.** `run --full-reparse` (`-f`) reads and parses the file again on each call. `[scripts.run.full-reparse]`
