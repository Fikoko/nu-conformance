# Aliases

Draft rules for aliases. The lang guide has no chapter on aliases yet, so these follow the Book's [Aliases](https://www.nushell.sh/book/aliases.html) page.

**Checked against:** Nushell 0.116.1.

Where an alias is visible is covered in [Variable Scope](scope.md#custom-commands). Paragraphs marked **Open question** describe current behavior that may not be intended, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** `alias name = expansion` defines an alias. Calling the alias works as if its expansion had been written in its place, followed by any arguments and flags given to the alias. `[aliases.intro]`

## Expansion

**Defined.** An alias can expand to a command with some of its arguments, or to a command that has subcommands, such as `math`. The subcommands are then available through the alias. `[aliases.expansion.command]`

**Defined.** An alias can expand to another alias. Chains of aliases expand fully. `[aliases.expansion.alias]`

**Defined.** An alias can expand to an external command written with `^`. `[aliases.expansion.external]`

**Defined.** The expansion must start with a command. A value such as a variable, a number or a quoted string is a parse error, `nu::parser::cant_alias_expression`. An empty expansion is a parse error, `nu::parser::incorrect_value`. `[aliases.expansion.not-a-command]`

**Defined.** The expansion ends at the end of the line or at `;`. A `|` in it doesn't start a pipeline: it is passed to the command as an argument, together with the words after it. `[aliases.expansion.pipe]`

**Changes in 0.117.0** ([#19415](https://github.com/nushell/nushell/pull/19415)): a `|` or a redirection in an alias expansion is a parse error, `nu::parser::cant_alias_expression`.

**Defined.** Most parser keywords can't be the target of an alias, which is a parse error, `nu::parser::cant_alias_keyword`. This includes `let`, `mut`, `const`, `def`, `alias`, `use`, `export`, `extern`, `module`, `hide`, `source`, `source-env`, `run`, `where`, `for`, `while`, `loop`, `break`, `continue` and `return`. `if`, `match`, `try` and the `overlay` commands can be aliased, and the alias then works like the keyword. `[aliases.expansion.keywords]`

**Defined.** Syntax errors in the expansion are reported as in any other code: an unclosed bracket or quote is `nu::parser::unclosed_delimiter`, and a `}` that closes a block while a bracket inside it is still open is `nu::parser::unbalanced_delimiter`. `[aliases.expansion.errors]`

## Names

**Defined.** An alias name may start with a digit. A parser keyword can't be an alias name, which is a parse error, `nu::parser::name_is_keyword`. Leaving out the name is a parse error, `nu::parser::assignment_mismatch`. `[aliases.names.allowed]`

**Defined.** An alias may have the same name as a built-in command, and then calling the name uses the alias. `[aliases.names.shadow]`

**Defined.** A second alias with the same name in the same block replaces the first from that point on. `[aliases.names.redefine]`

## Using aliases

**Defined.** An alias can be used from the statement after the one that defines it, to the end of the block, including inside the bodies of commands defined after it. It can't be used before its definition, unlike a `def`. `[aliases.position]`

**Defined.** `--help` on an alias shows the help of the aliased command. `scope aliases` lists aliases with their `expansion`. `[aliases.help]`

**Defined.** `export alias` outside a module defines an ordinary alias. `[aliases.export]`
