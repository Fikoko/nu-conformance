# Custom Commands

Draft rules for the [Custom Commands](https://www.nushell.sh/lang-guide/chapters/custom_commands.html) chapter of the lang guide, and the Book's [Custom Commands](https://www.nushell.sh/book/custom_commands.html) page it points to. It covers defining and calling commands, names, shadowing, parameters, flags, rest parameters, closures, input and output types, `def --wrapped`, documentation, attributes and `def --env`. The lang guide's [Type Signatures](https://www.nushell.sh/lang-guide/chapters/types/type_signatures.html) page is covered here too.

**Checked against:** Nushell 0.116.1.

Where a command's body can see variables, and how `def --env` works, is covered in [Variable Scope](scope.md#custom-commands). `return` is covered in [Flow Control](flow.md#return), and spreading arguments in [Operators](operators.md#spread).

Paragraphs marked **Open question** describe current behavior that may not be intended, **Confirmed** paragraphs record behavior the maintainers have confirmed as intended, and **Changes in 0.117.0** notes describe decided changes that aren't released yet. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** `def name [parameters] { body }` defines a custom command, which is then called like a built-in command. Arguments and flags are parsed and type-checked while parsing. `[commands.intro]`

## Defining and calling

**Defined.** A custom command is called by its name followed by its arguments. A command can call itself. `[commands.def.basic]`

**Defined.** The result of a command is the value of the last expression in its body. If the last expression is a statement such as `for`, the result is `null`. An empty body passes its input through, so it gives `null` without input. `[commands.def.result]`

**Defined.** Pipeline input to a command is available in its body as `$in`, and a command at the start of its body receives that input, so `def double [] { each {|n| 2 * $n } }` works on a list. Input is streamed: a command can process an infinite stream when the rest of the pipeline stops early. If the command declares input types, other input is a parse error, `nu::parser::input_type_mismatch`. `[commands.def.input]`

## Names

**Defined.** A command name may contain letters from any script, digits, `-` and emoji. `[commands.names.characters]`

**Defined.** Parser keywords, such as `if`, `for`, `let`, `def`, `use` and `where`, can't be command names. That is a parse error, `nu::parser::name_is_keyword`. `[commands.names.keywords]`

**Defined.** The name must be written in the definition. A variable as the name is a parse error, `nu::parser::unknown_state`. `[commands.names.static]`

**Defined.** A name with a space defines a subcommand, such as `def "str shout"`, which is called with the words separated by a space. The first word alone is not a command. `[commands.names.subcommands]`

## Shadowing

**Defined.** A custom command may have the same name as a built-in command, and then calling the name runs the custom command. `%name` calls the built-in, also with a variable (`%$cmd`). `%` before a name that isn't a built-in command is a parse error, `nu::parser::error`. `[commands.shadow.builtin]`

## Parameters

**Defined.** Parameters in `[ ]` can be separated by spaces, commas or line breaks. `[commands.params.separators]`

**Defined.** A parameter written as just a name, or `name: type`, is a required positional parameter. A missing argument is a parse error, `nu::parser::missing_positional`, and an extra one is a parse error, `nu::parser::extra_positional`. `[commands.params.required]`

**Defined.** `name?` makes a positional parameter optional. When it isn't given, its value is `null`. `[commands.params.optional]`

**Defined.** `name = value` gives a positional parameter a default value and makes it optional. A default may be combined with a type and with `?`. `[commands.params.default]`

**Defined.** A default value must be a constant: a literal or a `const` variable. Anything else is a parse error, `nu::parser::non_constant_default_value`. A default that doesn't match the parameter's type is a parse error, `nu::parser::parse_mismatch`. `[commands.params.default-constant]`

**Defined.** `name: type` declares a parameter's type, with or without a space after `:`. An argument of the wrong type is a parse error, `nu::parser::parse_mismatch`. Without a type, a parameter accepts any value. Besides the value types, `number`, `oneof<...>` and `external_arg` can be used; `external_arg` keeps a bare word exactly as written, so `0001` stays a string. An unknown type name is a parse error, `nu::parser::unknown_type`. `[commands.params.types]`

**Defined.** Required positional parameters must come before optional ones, otherwise it is a parse error, `nu::parser::required_after_optional`. A command can have only one rest parameter, otherwise it is a parse error, `nu::parser::multiple_rest_params`. `[commands.params.order]`

**Defined.** A positional parameter written after the rest parameter receives the first argument, and the rest parameter receives the others. `[commands.params.after-rest]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): a positional parameter after the rest parameter is a parse error, `nu::parser::positional_after_rest`.

**Defined.** Two parameters with the same name, or two flags with the same short name, are accepted. The later parameter gets the value, and the short flag sets only the first flag that declared it. `[commands.params.duplicates]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): two parameters or flags with the same name, or the same short name, are a parse error, `nu::parser::duplicate_parameter`.

**Defined.** A signature can combine required, optional and defaulted positional parameters, switches and flags with values and defaults. `[commands.params.kinds]`

## Flags

**Defined.** `--name: type` declares a flag that takes a value, written as `--name value` or `--name=value`, before or after the positional arguments. When the flag isn't given, its value is `null`, or its default when it has one. A flag without its value is a parse error, `nu::parser::missing_flag_param`, and a value of the wrong type is a parse error, `nu::parser::parse_mismatch`. `[commands.flags.value]`

**Defined.** `--name (-n)` gives a flag a one-letter short form, used as `-n`. The variable is always named after the long form. `-n` alone declares a flag with only a short form. Several short switches can be combined, as in `-ab`. A short form with more than one letter is a parse error, `nu::parser::parse_mismatch`. `[commands.flags.short]`

**Defined.** A flag without a type is a switch: its value is `true` when given and `false` otherwise. `--name=true` and `--name=false` set it explicitly. With a space, `--name true` passes `true` as a positional argument. A switch can't have a type annotation, which is a parse error, `nu::parser::error`. `[commands.flags.switch]`

**Defined.** In a flag's variable name, `-` is replaced by `_`, so `--all-caps` is `$all_caps`. A flag the command doesn't declare is a parse error, `nu::parser::unknown_flag`. `[commands.flags.names]`

**Defined.** If a flag whose type doesn't accept `nothing` is given `null`, it is treated as not given, so its default applies. If its type accepts `nothing`, such as `any`, the `null` is passed. `[commands.flags.null]`

**Defined.** A record spread into a call (`...$record`) passes its keys as flags. A key that isn't a flag of the command is a runtime error, `nu::shell::error`. `[commands.flags.spread]`

**Defined.** Every custom command has a `--help` (`-h`) flag that shows its help. Declaring a `--help` flag yourself is accepted, but `--help` still shows the help. `[commands.flags.help]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): declaring a `--help` flag is a parse error, `nu::parser::error`.

## Rest parameters

**Defined.** `...name` (optionally `...name: type`) collects any remaining positional arguments into a list, which is empty when there are none. It can follow positional parameters, and a list can be spread into it. Each argument is type-checked, so a wrong type is a parse error, `nu::parser::parse_mismatch`. `[commands.rest.collect]`

**Defined.** A standalone `--` ends flag parsing. Every later argument is positional, even if it starts with `-`, and the `--` itself isn't passed. This applies to built-in commands too. `[commands.rest.end-of-flags]`

## Closures

**Defined.** A command can take a closure as a parameter and run it with `do`. `[commands.closure.parameter]`

**Defined.** A closure's parameter types are checked when the closure runs, so a wrong argument is a runtime error, here `nu::shell::cant_convert`. A closure stored in a variable can only be used after the `let`, which is a parse error otherwise, `nu::parser::variable_not_found`. `[commands.closure.checking]`

## Input and output types

**Defined.** `def name [params]: input -> output { ... }` declares the types of the command's pipeline input and output. Several pairs can be given in brackets, separated by commas or line breaks: `[list -> string, string -> string]`. There may be a space before the `:`, but `->` needs spaces around it; `int->int` is a parse error, `nu::parser::unknown_type`. Without a declaration, input and output are `any`. `[commands.sig.declare]`

**Defined.** Input that matches none of the declared input types is a parse error, `nu::parser::input_type_mismatch`, when its type is known while parsing. When it is only known at runtime, it is a runtime error, `nu::shell::only_supports_this_input_type`. `[commands.sig.input]`

**Defined.** The body must produce the declared output type for each input type, which is checked while parsing. A mismatch is a parse error, `nu::parser::output_type_mismatch`. That includes a body ending in `print`, which outputs `nothing`, and an empty body, which outputs its input. `[commands.sig.output]`

**Defined.** A typed flag that isn't given is `null`, and a switch that isn't given is `false`. Closure parameters can have types too. `[commands.sig.flags]`

## `def --wrapped`

**Defined.** A command defined with `def --wrapped` must have a rest parameter, otherwise it is a parse error, `nu::parser::missing_positional`. Flags and arguments it doesn't declare, including `--`, are collected into the rest parameter as strings, in order, so they can be passed on with `...$rest`. Flags it does declare are parsed as usual. `[commands.wrapped.rest]`

## Documentation

**Defined.** Comment lines directly above a `def` document the command. The first line is its `description`, and lines after a blank comment line are its `extra_description`. A blank line between the comments and the `def` stops them from being documentation. The documentation appears in `help` and `scope commands`. `[commands.doc.comments]`

**Defined.** A comment after a parameter, separated by a space, is that parameter's description. `[commands.doc.parameters]`

## Attributes

**Defined.** `@example "description" { code } --result value` above a `def` adds an example to the command's help and to `scope commands`. `[commands.attr.example]`

**Defined.** `@category "name"` sets the command's category. `[commands.attr.category]`

**Defined.** `@deprecated` marks a command as deprecated. Calling it still runs it, and also reports a warning, `nu::parser::deprecated`, including the message given to `@deprecated`. `[commands.attr.deprecated]`

**Defined.** By default, the deprecation warning is reported once, for the first call. In a script, `--report every` also reports only one warning for several calls. `[commands.attr.deprecated-report]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): every deprecation warning is reported, so `--report every` warns on each call.

**Defined.** An attribute name that isn't a known attribute is a parse error, `nu::parser::unknown_command`. `[commands.attr.unknown]`

## `def --env`

**Defined.** Changes a command makes to `$env`, including `cd`, are discarded when it returns, unless the command is defined with `def --env`. `[commands.env.def-env]`
