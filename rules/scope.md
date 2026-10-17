# Variable Scope

Draft rules for the [Variable Scope](https://www.nushell.sh/lang-guide/chapters/variable_scope.html) chapter of the lang guide.

**Checked against:** Nushell 0.116.1.

How variables are declared is covered in [Declarations](declarations.md).

Paragraphs marked **Open question** describe current behavior that may not be intended. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** Nushell is lexically scoped. Every block starts a new scope, and a variable is visible from its declaration to the end of the block that contains it, including nested blocks, closures and custom commands. The environment follows different rules. `[scope.intro]`

## Blocks

**Defined.** A variable declared inside a block isn't visible after the block ends, which is a parse error, `nu::parser::variable_not_found`. A declaration inside a block with the same name as an outer variable shadows it only until the block ends. `[scope.block.local]`

**Defined.** Variables are resolved while parsing, so a variable can only be used after its declaration. Each iteration of a loop has a new scope, so a variable declared in one iteration isn't visible in the next. Both are parse errors, `nu::parser::variable_not_found`. `[scope.block.order]`

**Defined.** The blocks of `if`/`else`, `match`, `for`, `while`, `loop` and `try` run in the scope of the surrounding code, so they can assign to `mut` variables declared outside. `[scope.block.mut]`

## Closures

**Defined.** A closure captures the values of the variables it uses when it is created. Shadowing a variable afterwards doesn't change what the closure sees, and the closure keeps its captured values after the scope that declared them has ended. `[scope.closure.capture]`

**Defined.** A closure can't use a `mut` variable from outside it. That includes closures written as `{|| ...}` or `{ ... }` and those given to commands like `each` and `do`. It is a parse error, `nu::parser::expected_keyword` ("capture of mutable variable"). `[scope.closure.no-mut]`

**Defined.** `where` can read `mut` variables from outside, whether its condition is written as a row condition, a block or a closure with a parameter. `[scope.closure.where]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): assigning to a `mut` variable inside a `where` condition is a parse error, `nu::parser::expected_keyword`. Reading one is still allowed.

**Open question:** the lang guide says the closures given to `where` can't capture `mut` variables, but `where` can read them in every form, including `{|v| $v > $x }`.

## Custom commands

**Defined.** A custom command's body sees the variables in scope where the command is defined, not where it is called, with their values at the time of definition. Like a closure, it can't use a `mut` variable from outside, which is a parse error, `nu::parser::expected_keyword`. Parameters and variables declared in the body are local to the command. `[scope.def.variables]`

**Defined.** `def` and `alias` definitions are visible only in the block where they are made, but in the whole block, including before the line that defines them. A command defined inside another command, a block or a closure isn't visible outside it. `[scope.def.visibility]`

**Defined.** Defining the same command twice in one block is a parse error, `nu::parser::duplicate_command_def`. `[scope.def.duplicate]`

## Environment

**Defined.** Changes to `$env`, including changing the directory with `cd`, made inside `do`, `each` or another closure, or inside a custom command, are discarded when it returns. `[scope.env.discarded]`

**Defined.** Changes to `$env` and the directory made inside `if`/`else`, `match`, `for`, `while`, `loop` and `try`, including `catch`, are kept afterwards. So are changes made inside `do --env` and in a command defined with `def --env`. `[scope.env.kept]`

**Defined.** A closure doesn't capture `$env`. It reads the environment when it runs. `[scope.env.read-at-run]`
