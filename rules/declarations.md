# Declarations

Draft rules for the [Declarations](https://www.nushell.sh/lang-guide/chapters/declarations.html) chapter of the lang guide, and the Book's [Variables](https://www.nushell.sh/book/variables.html) page it points to.

**Checked against:** Nushell 0.116.1.

Assignment operators are covered in the [Operators](operators.md#assignment) chapter, and where declarations are visible in [Variable Scope](scope.md).

Paragraphs marked **Open question** describe current behavior that may not be intended, **Confirmed** paragraphs record behavior the maintainers have confirmed as intended, and **Changes in 0.117.0** notes describe decided changes that aren't released yet. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** `let`, `mut` and `const` declare variables. `let` and `mut` values are computed when the code runs, `const` values while it is parsed. Only `mut` variables can be reassigned. `unlet` removes a variable. `[declarations.intro]`

## `let`

**Defined.** `let name = value` binds a name to a value. The right side of `=` is a whole pipeline, and its result is the value. There must be whitespace around `=`, and the right side must be a single pipeline, otherwise it is a parse error, `nu::parser::parse_mismatch`. `[declarations.let.binding]`

**Defined.** `let name: type = value` checks the value against the type annotation while parsing. A mismatch is a parse error, `nu::parser::type_mismatch`. The annotation sets the variable's declared type, but the value keeps its own type, so after `let x: any = 1`, `$x | describe` is `int`. `[declarations.let.annotation]`

**Defined.** The item types of a list annotation such as `list<int>` are checked when the code runs, even when the value is a list literal. A mismatch is a runtime error, `nu::shell::type_mismatch`. `[declarations.let.annotation-items]`

**Confirmed** ([#1](https://github.com/Fikoko/nu-conformance/issues/1)): intended: element types in an annotation are checked at runtime, as part of gradual typing.

**Defined.** `let name` without `=` takes its value from the pipeline input and passes the same value on as its output, so it can be in the middle or at the end of a pipeline. With no input, the value is `null`. `[declarations.let.from-pipeline]`

**Defined.** A `let` variable can't be assigned to, which is a parse error, `nu::parser::assignment_requires_mutable_variable`. A new `let` with the same name shadows it, and its right side can still use the old value. `[declarations.let.immutable]`

## Variable names

**Defined.** A variable name can't contain any of `.` `[` `(` `{` `+` `-` `*` `^` `/` `=` `!` `<` `>` `&` `|`, which is a parse error, `nu::parser::parse_mismatch`. Other characters are allowed, including `_`, non-ASCII letters and a leading digit. `[declarations.names.characters]`

**Defined.** A name in a declaration may start with `$`, which is ignored: `let $var = 42` declares `var`. `[declarations.names.dollar]`

**Defined.** `nu`, `env`, `in` and `ans` are the names of built-in variables and can't be used for variables or parameters. That is a parse error, `nu::parser::name_is_builtin_var`. Other words, including `it`, `true` and `null`, can be variable names. `[declarations.names.reserved]`

## `mut`

**Defined.** `mut name = value` declares a variable that can be reassigned and changed through cell paths. It must have an initial value; without one it is a parse error, `nu::parser::missing_positional`. Unlike `let`, `mut` can't take its value from a pipeline, which is a parse error, `nu::parser::unexpected_keyword`. `[declarations.mut.binding]`

**Defined.** A `mut` variable's type comes from its annotation or, without one, from its initial value. Assigning a value of another type is a parse error, `nu::parser::operator_incompatible_types`. Annotating it as `any` allows any value. An initial value that doesn't match the annotation is a parse error, `nu::parser::type_mismatch`. `[declarations.mut.type]`

## `const`

**Defined.** `const name = value` evaluates its value while the code is parsed. The value can be a literal, an operator expression, another constant, `$nu`, or a call to a built-in command that can run at parse time. Any other command is a parse error, `nu::parser::error` (wrapping `nu::shell::not_a_const_command`), and is reported before any of the script runs. `[declarations.const.parse-time]`

**Implementation-defined.** Which built-in commands can run at parse time (`scope commands | where is_const`). In Nushell 0.116.1, `length`, `ls` and `date now` can't. `[declarations.const.commands]`

**Defined.** A `const` value can't use `let` or `mut` variables, and places that need a parse-time value, such as the path given to `use`, can't use them either. That is a parse error, `nu::parser::error` (wrapping `nu::shell::not_a_constant`). `[declarations.const.constant-operands]`

**Defined.** A `const` can't be reassigned, which is a parse error, `nu::parser::assignment_requires_mutable_variable`, but it can be shadowed by another `const`. Its type annotation is checked like that of `let`. `[declarations.const.immutable]`

## `unlet`

**Defined.** `unlet $a $b ...` deletes the named `let` or `mut` variables. Using one afterwards is a runtime error, `nu::shell::variable_not_found`. The name can be declared again. `[declarations.unlet.delete]`

**Defined.** `unlet` on a `const` does nothing: the constant can still be used afterwards. `[declarations.unlet.const]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): `unlet` on a constant is a compile error, `nu::compile::invalid_literal`.

**Defined.** `unlet` can't delete `$nu` or `$env`, and its arguments must be variable references. Both are compile errors, `nu::compile::invalid_literal`. `unlet $in` is accepted. `[declarations.unlet.builtins]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): `unlet $in` is a compile error, `nu::compile::invalid_literal`.