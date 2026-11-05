# Source Text and Parse Errors

Draft rules for how `nu` reads the text of a script and reports syntax errors. Neither the lang guide nor the Book has a chapter on this, so these rules come from testing. They cover what a parser has to agree on beyond the grammar: which bytes it accepts, which error it reports first, and which unusual forms it accepts.

**Checked against:** Nushell 0.116.1.

Tests that need exact bytes, such as a NUL byte, invalid UTF-8 or Windows line endings, are in `tests/parsing/raw/`, which Git keeps byte for byte. Paragraphs marked **Open question** describe current behavior that may not be intended, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** A script is parsed completely before any of it runs. If parsing finds an error, nothing runs. `[parsing.intro]`

## Source text

**Defined.** Code and string literals must be valid UTF-8. Invalid bytes there are a parse error, `nu::parser::non_utf8`. Invalid bytes in a comment are ignored. `[parsing.source.utf8]`

**Defined.** A UTF-8 byte-order mark at the start of a file is not skipped. It becomes part of the first word, so a script that starts with one usually fails with an unknown command, a runtime error, `nu::shell::external_command`. `[parsing.source.bom]`

**Changes in 0.117.0** ([#19415](https://github.com/nushell/nushell/pull/19415)): a byte-order mark at the start of a script, a module file or a config file is skipped.

**Defined.** A line ends with LF or with CR LF. A CR LF inside a string literal is kept. A CR on its own doesn't end a line. `[parsing.source.line-endings]`

**Defined.** Spaces and tabs separate words. Other whitespace characters, such as a form feed, a vertical tab or a no-break space, don't: they are part of the word around them. `[parsing.source.whitespace]`

**Defined.** A NUL byte is kept in a string literal and ignored in a comment. Elsewhere it is part of the word around it. `[parsing.source.nul]`

**Defined.** An empty script, or one with only comments and whitespace, runs without output. The last line doesn't need to end with a line break. `[parsing.source.empty]`

## Which error is reported

**Defined.** Only one parse error is reported. An unclosed bracket or quote is reported first, wherever it is in the file. Otherwise the error that comes first in the source is reported. `[parsing.errors.first]`

**Defined.** Brackets, braces, parentheses and quotes are matched across nested blocks, closures, records, lists, subexpressions and string interpolation. Reaching the end of the file with one still open is a parse error, `nu::parser::unclosed_delimiter`. A closing bracket, brace or parenthesis that doesn't match the innermost open one, or has nothing to close, is a parse error, `nu::parser::unbalanced_delimiter`. A `(` in a bare word, as in `^cmd foo(`, also has to be closed. `[parsing.errors.delimiters]`

**Defined.** A binary operator with nothing after it is a parse error, `nu::parser::incomplete_math_expression`, also inside a subexpression or string interpolation. `[parsing.errors.math]`

**Defined.** A keyword missing a required part is a parse error. A missing first argument, as in `let`, `def f`, `use` or `if true`, is `nu::parser::missing_positional`. A missing part after a keyword word, as in `let x =`, `else` or `for x in`, is `nu::parser::keyword_missing_arg`. `for` without `in` is `nu::parser::expected_keyword`. `[parsing.errors.keywords]`

**Defined.** In a `match` arm, a missing pattern, a missing `=>` or a missing result is a parse error, `nu::parser::type_mismatch`. `[parsing.errors.match]`

**Defined.** A default value of the wrong type for a typed parameter is a parse error, `nu::parser::parse_mismatch`, in custom commands and in closures. So is a default that is an expression rather than a constant. In a closure, an `int` default for a `string` parameter is accepted. `[parsing.errors.defaults]`

## Long blocks

**Defined.** The length of a block doesn't change how it is parsed. In a block of several kilobytes, each statement sees the commands, imports, aliases, hidden names and overlays that the statements before it set up, exactly as in a short block, and an error near the end is reported the same way. `[parsing.long-blocks]`

## Accepted forms

These forms are accepted even though some look like mistakes. The tests make sure a parser keeps accepting them, or that a change is noticed.

**Defined.** In a list or record literal, an extra comma between items is ignored, and items don't need commas between them. `[parsing.lenient.commas]`

**Defined.** `{a 1}`, braces whose contents have no `:` after the first word, is a closure, not a record. `[parsing.lenient.braces]`

**Defined.** `let x` without `=` declares `x` with the value `null`. `let $x = 1` declares `x`. `[parsing.lenient.let]`

**Defined.** A trailing `.` after a cell path is ignored: `[1 2] | get 0.` is `1`. `$.a` is a cell path. `[parsing.lenient.cell-path]`

**Defined.** A `|` inside a binary literal such as `0b[1|2]` splits the pipeline, so the parts are run as commands, which fails with `nu::shell::external_command`. Without `|`, an invalid digit is a parse error, `nu::parser::invalid_binary_string`. `[parsing.lenient.binary-pipe]`

**Defined.** Two subexpressions written together, as in `(1)(2)`, form a string from their values. `[parsing.lenient.adjacent]`
