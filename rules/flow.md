# Flow Control

Draft rules for the [Flow control](https://www.nushell.sh/lang-guide/chapters/flow_control/00_flow_control_overview.html) chapter of the lang guide, and the Book's [Control Flow](https://www.nushell.sh/book/control_flow.html) page it points to. The lang guide has no page for `for`, so its rules come from the Book. This part covers `if`/`else`, `for`, `while`, `loop`, `break` and `continue`. `match`, `try` and `return` are in part 2.

**Checked against:** Nushell 0.116.1.

How blocks and closures see variables is covered in [Variable Scope](scope.md).

Paragraphs marked **Open question** describe current behavior that may not be intended. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** `if` is an expression and produces a value. `for`, `while` and `loop` are statements: they produce `null`. The bodies of all four are blocks, not closures, so they can assign to `mut` variables from outside. `[flow.intro]`

## `if`

**Defined.** `if condition { ... }` runs its block when the condition is `true`. With `else`, the `else` part runs when it is `false`. `[flow.if.branches]`

**Defined.** The value of `if` is the value of the last expression in the block that ran. An empty block, or an `if` without `else` whose condition is `false`, produces `null`. `if` can be used in a pipeline, take input and pass its value on. `[flow.if.value]`

**Defined.** `else` is followed by an expression, not necessarily a block, so `if false { 1 } else 100` is `100`, and `else if` chains are checked in order. `else` must be on the same line as the closing `}` of the previous block. On its own line it is a command name. A condition followed by something other than a block is a parse error, `nu::parser::parse_mismatch`. `[flow.if.else]`

**Defined.** The condition is an expression and doesn't need parentheses. It must evaluate to a `bool`. Any other value, including `null`, numbers, strings and lists, is a runtime error, `nu::shell::cant_convert`. A condition in an `else if` that isn't reached is not evaluated. `[flow.if.condition]`

## `for`

**Defined.** `for name in value { ... }` runs the block once for each item of a list, each value of a range (including an infinite range) or each row of a table, with the item bound to `name`. An empty list runs it zero times. `[flow.for.iteration]`

**Defined.** If the value is not a list, range or table, the block runs once with the whole value. That includes records, numbers, strings and binary values. If the value is `null`, the block doesn't run. `[flow.for.single-value]`

**Open question:** a record is iterated as a single item rather than by its key-value pairs.

**Defined.** The loop variable may have a type annotation (`for i: int in ...`) and may be written with a leading `$`. It is immutable, and it and any variables declared in the body are not visible after the loop. `[flow.for.variable]`

**Defined.** `for` produces `null`, and it can't be used inside a pipeline, not even as the first element, which is a parse error, `nu::parser::unexpected_keyword`. In parentheses it can be used as a value. `for` takes no flags. `[flow.for.statement]`

**Open question:** `while` and `loop` can be the first element of a pipeline (`while false { } | describe` works), but `for` can't.

## `while`

**Defined.** `while condition { ... }` evaluates the condition before each iteration and runs the block while it is `true`, so the block may run zero times. The condition must evaluate to a `bool`, otherwise it is a runtime error, `nu::shell::type_mismatch`. A block given as the condition is a closure, so it can't read `mut` variables, which is a parse error, `nu::parser::expected_keyword`. `[flow.while.condition]`

**Open question:** a non-boolean condition is `nu::shell::type_mismatch` in `while`, but `nu::shell::cant_convert` in `if`.

**Defined.** `while` produces `null` and doesn't accept pipeline input, which is a parse error, `nu::parser::input_type_mismatch`. `while true { ... }` behaves like `loop { ... }`. `[flow.while.statement]`

## `loop`

**Defined.** `loop { ... }` runs its block repeatedly until a `break`, a `return` from the surrounding custom command, or an error stops it. `[flow.loop.repeat]`

**Defined.** `loop` produces `null`, and the value of its block is discarded on every iteration. It doesn't accept pipeline input, which is a parse error, `nu::parser::input_type_mismatch`. `[flow.loop.statement]`

**Defined.** Inside a custom command, `return` leaves the loop and the command, and can carry a value out. `[flow.loop.return]`

## `break`

**Defined.** `break` stops the innermost loop (`for`, `while` or `loop`) that contains it. Execution continues after that loop. It works from inside `if`, `match` and `try` blocks in the loop, and a `finally` of a surrounding `try` still runs. `[flow.break.stops]`

**Defined.** `break` outside a loop, including inside a closure or a custom command that is itself inside a loop, is a compile error, `nu::compile::not_in_a_loop`. `break` takes no value; giving one is a parse error, `nu::parser::extra_positional`. `[flow.break.placement]`

## `continue`

**Defined.** `continue` skips the rest of the current iteration of the innermost loop and starts the next one. If there is no next iteration, the loop ends. A `finally` of a surrounding `try` runs before the next iteration. `[flow.continue.skips]`

**Defined.** `continue` follows the same placement rules as `break`: outside a loop it is a compile error, `nu::compile::not_in_a_loop`, and giving it a value is a parse error, `nu::parser::extra_positional`. `[flow.continue.placement]`

**Defined.** In an `each` closure, `return` with no value ends the closure early, and `each` drops the `null` result, which gives the effect of `continue`. `[flow.continue.each-return]`
