# Pipelines

Draft rules for the [Pipelines](https://www.nushell.sh/lang-guide/chapters/pipelines.html) chapter of the lang guide, and the Book's [Pipelines](https://www.nushell.sh/book/pipelines.html) page it points to. It covers `$in`, how statements and pipelines are separated, external commands in pipelines, and redirection.

**Checked against:** Nushell 0.117.0.

The tests use `nu` itself as the external command, run with `$nu.current-exe`, so they behave the same on every platform. The lang guide's `demo.nu` (`print "foo"; print -e "barbar"`) is written as a `demo` command.

**Defined.** A pipeline is a sequence of stages separated by `|`. Each stage receives the previous stage's output as its input. `[pipelines.intro]`

## `$in`

**Defined.** In a stage of a pipeline that is an expression, `$in` is the previous stage's output. It can be used several times in the same expression and in cell paths and string interpolation. `[pipelines.in.stage]`

**Defined.** At the start of a block, closure or custom command body, `$in` is the input to that block. It keeps that value in every pipeline of the block that starts with `$in`, while inside a pipeline it is the previous stage's output, as above. Filters such as `each` give their closure the current item as `$in`. `[pipelines.in.block]`

**Defined.** Without input, `$in` is `null`. A `;` ends a pipeline, so `$in` right after it is `null`, not the previous statement's result. `[pipelines.in.no-input]`

**Defined.** `$in` collects a stream into a single value, so a stream of integers becomes a `list<int>`. `[pipelines.in.collect]`

## Pipeline structure

**Defined.** `let name` as a stage stores its input in a new variable and passes the input on to the next stage. `[pipelines.let]`

**Defined.** `;` separates statements. Each statement runs to completion, and the value of a block or script is the value of its last statement. The values of earlier statements made of internal commands are discarded. `[pipelines.statements]`

**Defined.** A pipeline can span several lines inside parentheses, with `|` at the end of a line. A line starting with `|` also continues the previous line's pipeline. `[pipelines.multiline]`

**Defined.** A command that takes no pipeline input doesn't receive it. A missing required argument is still a parse error, `nu::parser::missing_positional`, even when the input could supply it. `[pipelines.types]`

## External commands

**Defined.** The output of an external command is passed to the next stage as text, which internal commands such as `lines` can split. An external command's stderr is not part of the pipeline: it goes to the terminal. `[pipelines.external.output]`

**Defined.** A value piped into an external command is passed to it on its standard input. `[pipelines.external.input]`

**Defined.** If an external command in a pipeline exits with a non-zero code, the pipeline fails, even when a later stage succeeds. The error can be caught with `try`, and its record has an `exit_code` field. `complete` instead returns a record with `stdout`, `stderr` and `exit_code` without failing. `[pipelines.external.failure]`

**Defined.** In a block, parenthesized expression or custom command, only the last statement's output goes to the pipeline. The output of earlier external commands goes directly to the terminal. `[pipelines.external.block]`

## Redirection

**Defined.** `e>|` pipes an external command's stderr to the next stage instead of its stdout, which then goes to the terminal. `o+e>|` pipes both. A plain `|` pipes only stdout. `[pipelines.redirect.pipe]`

**Defined.** `o> file`, `e> file` and `o+e> file` write stdout, stderr or both to a file. A file redirection can be combined with piping the other stream. `[pipelines.redirect.file]`

**Implementation-defined.** The order of stdout and stderr lines when both go to the same pipe or file. `[pipelines.redirect.order]`

**Defined.** `e>|` and `o+e>|` only work on external commands. On an internal command, they are a runtime error, `nu::shell::error`. `[pipelines.redirect.internal]`

**Defined.** Redirecting the same stream twice, such as `o> file` together with `o+e>|`, is a parse error, `nu::parser::multiple_redirections`. `[pipelines.redirect.multiple]`

**Defined.** `complete` treats whatever is piped into it as the command's stdout, so after `e>|` its `stdout` field holds the command's stderr, and its `stderr` field holds the command's stdout. `[pipelines.redirect.complete]`

**Defined.** The long forms `out>`, `err>`, `out+err>` and `err+out>`, and the short form `e+o>`, are the same as `o>`, `e>` and `o+e>`. The same goes for `err>|`, `out+err>|`, `err+out>|` and `e+o>|`. There is no `o>|`: a plain `|` pipes stdout, and `o>|` is a parse error, `nu::parser::parse_mismatch`. `[pipelines.redirect.forms]`

**Defined.** `o>> file`, `e>> file` and `o+e>> file` append to the file instead of replacing it. `[pipelines.redirect.append]`

**Defined.** A redirection can come anywhere after the command name. Words after it are still arguments of the command, so `echo a o> f.txt b` writes `a` and `b` to the file. After a value that isn't a command call, such as `"a" o> f.txt`, nothing more may follow, which is a parse error, `nu::parser::parse_mismatch`. `[pipelines.redirect.position]`

**Defined.** The output of an internal command or a value can be written to a file with `o>` or `o>>`. A list is written one item per line, each followed by a line break, while a string is written without a line break after it. `[pipelines.redirect.values]`

**Defined.** The file name can be a bare word, a quoted string, a variable or a subexpression. The redirection operator must be followed by a space: `o>file` is an ordinary argument, not a redirection. A redirection without a file name is a parse error, `nu::parser::parse_mismatch`. `[pipelines.redirect.target]`

**Defined.** A redirection must follow a command. One at the start of a pipeline, right after `|`, or after another `e>|` is a parse error, `nu::parser::unexpected_redirection`. `[pipelines.redirect.misplaced]`

**Defined.** A redirection after a block run with `do`, or after a subexpression, applies to the external commands' output inside it. `[pipelines.redirect.blocks]`

**Defined.** A command whose stdout is redirected to a file outputs `null`. `[pipelines.redirect.file-output]`

**Unspecified.** Redirecting stdout and stderr separately to the same file, as in `e> f.txt o> f.txt`, is accepted, but what the file contains afterwards is unspecified. Use `o+e>` to write both streams to one file. `[pipelines.redirect.same-file]`
