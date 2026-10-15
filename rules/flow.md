# Flow Control

Draft rules for the [Flow control](https://www.nushell.sh/lang-guide/chapters/flow_control/00_flow_control_overview.html) chapter of the lang guide, and the Book's [Control Flow](https://www.nushell.sh/book/control_flow.html) page it points to. The lang guide has no page for `for`, so its rules come from the Book. It covers `if`/`else`, `for`, `while`, `loop`, `break`, `continue`, `match`, `try`/`catch`/`finally` and `return`.

**Checked against:** Nushell 0.116.1.

How blocks and closures see variables is covered in [Variable Scope](scope.md).

Paragraphs marked **Open question** describe current behavior that may not be intended. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** `if`, `match` and `try` are expressions and produce a value. `for`, `while` and `loop` are statements: they produce `null`. The bodies of all four are blocks, not closures, so they can assign to `mut` variables from outside. `[flow.intro]`

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

## `match`

**Defined.** `match value { pattern => expression ... }` compares the value against each pattern from top to bottom and evaluates the arm of the first pattern that matches. Arms are separated by commas or line breaks. An arm's result is a single expression; a block can be used for several statements. `[flow.match.arms]`

**Defined.** The value of `match` is the value of the chosen arm. If no arm matches, or there are no arms, it is `null`. The value to match must be given, so to match pipeline input, use `$in`. `[flow.match.value]`

**Defined.** A literal pattern matches a value equal to it. A bare word is a string pattern. `null`, `true` and `false` match themselves. A range pattern matches a number in the range, including open and exclusive ranges. `p1 | p2` matches either pattern. Values of different types don't match, except integers and floats, which match by value. `[flow.match.literals]`

**Defined.** A range pattern matches only the values the range produces. A float between two integer bounds doesn't match, so `match 1.5 { 1..2 => 'in' }` doesn't match. `[flow.match.range-values]`

**Open question:** the lang guide says a range pattern matches "a number inside the range", which suggests `1.5` should match `1..2`.

**Defined.** A pattern in parentheses is evaluated while parsing and matches its value, so it can use constants and constant expressions. A `let` or `mut` variable in parentheses is a parse error, `nu::parser::error`. `[flow.match.constants]`

**Defined.** A `$name` pattern matches any value and binds it to a new variable for the guard and the arm. It never compares against an existing variable of the same name. `_` matches any value without binding it. `[flow.match.binding]`

**Defined.** A list pattern `[p1, p2, ...]` matches a list with exactly that many items, each matching its pattern. `[p1, ..$rest]` matches a list with at least the listed items and binds the remaining items to `$rest`. `..` without a name doesn't bind them. `[]` matches only an empty list. List patterns can be nested. `[flow.match.lists]`

**Defined.** A record pattern `{key: pattern, ...}` matches a record that has every named key with a matching value. Other keys are ignored. `{$name}` is shorthand for `{name: $name}`. `[flow.match.records]`

**Defined.** A pattern can be followed by `if condition`. The condition is checked only when the pattern matches and can use the variables it bound. If it is `false`, matching continues with the next arm. A condition that isn't a `bool` is a runtime error, `nu::shell::match_guard_not_bool`. `[flow.match.guards]`

## `try`

**Defined.** `try { ... }` runs its block. If an error happens inside it, the rest of the block is skipped, and the value of `try` is the value of the `catch` closure, or `null` without one. If no error happens, the value is the block's value. Pipeline input to `try` is the block's input. `[flow.try.value]`

**Defined.** `catch` and `finally` must be closures, and `catch` must come before `finally`. Each may appear at most once. A `catch` that isn't a closure is a parse error, `nu::parser::parse_mismatch_with_full_string_msg`. Wrong order or a repeated part is a compile error, `nu::compile::invalid_keyword_call`. `[flow.try.syntax]`

**Defined.** The `catch` closure receives a record describing the error, both as its parameter and as `$in`. Its fields are `msg`, `debug`, `raw`, `rendered` and `details`, and `details` holds `msg`, `code`, `help` and other information. `[flow.try.error-record]`

**Implementation-defined.** The contents of `debug` and `rendered`. `[flow.try.error-record-text]`

**Defined.** A failing external command inside `try` is an error that can be caught, including a command that isn't found. When an external command exits with a non-zero code, the error record also has an `exit_code` field. `[flow.try.external]`

**Defined.** An error raised inside `catch` propagates out of the `try`. Returning the error record's `raw` field from `catch` raises the original error again. `[flow.try.catch-errors]`

**Defined.** `finally` runs after the block succeeds, after `catch`, before an uncaught error propagates, and when `return`, `break` or `continue` leaves the `try`. It receives, as its parameter and as `$in`, the value of the block or of `catch`, the error record of an uncaught error, or `null` after `return`, `break` or `continue`. Its own value is discarded. `[flow.try.finally]`

**Defined.** The `try` block is a block, so it can assign to `mut` variables. `catch` and `finally` are closures, so they can't, which is a parse error, `nu::parser::expected_keyword`. `[flow.try.mut]`

**Defined.** Parse errors can't be caught, because the whole script is parsed before anything runs. `[flow.try.parse-errors]`

**Defined.** `exit` inside `try` ends the script and is not caught. `[flow.try.exit]`

## `return`

**Defined.** `return value` ends the current custom command or closure and makes the value its result. Without a value, the result is `null`. `return` takes at most one value; more is a parse error, `nu::parser::extra_positional`. `[flow.return.early]`

**Defined.** `return` leaves the nearest custom command or closure. Blocks of `if`, `match`, `try`, `for`, `while` and `loop` aren't functions, so `return` inside them leaves the whole command. Inside a closure, such as the one given to `each` or `do`, it ends only that call of the closure. `[flow.return.scope]`

**Defined.** At the top level of a script, `return` stops the rest of the script, and its value is the script's result. `[flow.return.top-level]`

**Defined.** A `finally` of a surrounding `try` runs before `return` leaves, and the returned value is kept. `[flow.return.finally]`
