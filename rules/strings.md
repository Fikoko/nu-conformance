# Strings

Draft rules for strings, following the [Strings and Text Formatting](https://www.nushell.sh/lang-guide/chapters/strings_and_text.html) chapter of the lang guide and the [String](https://www.nushell.sh/lang-guide/chapters/types/basic_types/string.html) type page. Where the lang guide defers to the Book's [Working with Strings](https://www.nushell.sh/book/working_with_strings.html), the Book's examples are tested too.

**Checked against:** Nushell 0.116.1.

Commands that work on strings (`str ...`, `split ...` and so on) are out of scope ([D1](../design-decisions.md#d1-scope-language-first-commands-later)). Operators on strings belong to the Operators chapter.

Paragraphs marked **Open question** describe current behavior that may not be intended, **Confirmed** paragraphs record behavior the maintainers have confirmed as intended, and **Changes in 0.117.0** notes describe decided changes that aren't released yet. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** A string is a sequence of Unicode characters. Nushell has six forms of string literal: single-quoted, double-quoted, raw, backtick-quoted, bare words and interpolated strings. They differ in how they are delimited, whether they process escape sequences, and whether they evaluate expressions. `[strings.intro]`

**Defined.** Every form of string literal produces a value of type `string`. Two strings written in different forms are equal if they contain the same characters. `[strings.type]`

**Defined.** A string is UTF-8 encoded. Converting a string to binary gives its UTF-8 bytes. `[strings.utf8]`

## Single-quoted strings

**Defined.** A single-quoted string starts and ends with `'`. It may contain any character except `'`, including `"`, `#` and newlines. A newline inside the quotes is part of the string. `[strings.single-quoted.syntax]`

**Defined.** A single-quoted string processes no escape sequences and no interpolation. A backslash and parentheses are ordinary characters. `[strings.single-quoted.no-escapes]`

**Defined.** A single-quoted string with no closing `'` is a parse error, `nu::parser::unclosed_delimiter`. `[strings.single-quoted.unclosed]`

## Double-quoted strings

**Defined.** A double-quoted string starts and ends with `"`. It may contain `'` and newlines. A newline inside the quotes is part of the string. A `"` inside the string must be escaped as `\"`. `[strings.double-quoted.syntax]`

**Defined.** In a double-quoted string, these escape sequences produce control characters: `\a` bell (U+0007), `\b` backspace (U+0008), `\e` escape (U+001B), `\f` form feed (U+000C), `\n` line feed (U+000A), `\r` carriage return (U+000D), `\t` tab (U+0009), and `\0` null (U+0000). `[strings.double-quoted.escapes.control]`

**Defined.** In a double-quoted string, a backslash followed by one of `"` `'` `\` `/` `(` `)` `{` `}` `$` `^` `#` `|` `~` produces that character. `[strings.double-quoted.escapes.literal]`

**Defined.** In a double-quoted string, a backslash followed by a space produces a space. `[strings.double-quoted.escapes.space]`

**Defined.** In a double-quoted string, `\x` followed by exactly two hex digits (upper or lower case) produces the byte with that value. Several `\x` escapes in a row can form a multi-byte UTF-8 character. `\x` followed by fewer than two hex digits, or by characters that aren't hex digits, is a parse error, `nu::parser::error`. `[strings.double-quoted.escapes.hex]`

**Defined.** If the bytes produced by `\x` escapes don't form valid UTF-8, it is a parse error. Today the error is `nu::parser::parse_mismatch`. `[strings.double-quoted.escapes.hex-utf8]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): the error is `nu::parser::error`.

**Defined.** In a double-quoted string, `\u{...}` with 1 to 6 hex digits (upper or lower case) produces the Unicode character with that code point. An empty `\u{}`, more than 6 digits, a value above `10FFFF`, or a surrogate code point (`D800` to `DFFF`) is a parse error, `nu::parser::error`. `[strings.double-quoted.escapes.unicode]`

**Defined.** `\u` not followed by `{` (the old `\uXXXX` form) is a parse error, `nu::parser::error`. `[strings.double-quoted.escapes.unicode-old-form]`

**Defined.** In a double-quoted string, a backslash followed by any other character is a parse error, `nu::parser::error`. Escape letters are case-sensitive, so `\U` and `\X` are errors. A common case is a Windows path such as `"C:\Program Files"`, where `\P` is not a valid escape. `[strings.double-quoted.escapes.unknown]`

**Defined.** A double-quoted string with no closing `"` is a parse error, `nu::parser::unclosed_delimiter`. A `"` preceded by a backslash does not close the string, so `"abc\"` is also unclosed. `[strings.double-quoted.unclosed]`

## Raw strings

**Defined.** A raw string starts with `r#'` and ends with `'#`. It processes no escape sequences and no interpolation. It may contain `'`, `"` and newlines. `[strings.raw.syntax]`

**Defined.** A raw string may start with `r` followed by any number of `#` (at least one) and `'`. It then ends at the first `'` followed by the same number of `#`. A `'` followed by fewer `#` is part of the string. `[strings.raw.hashes]`

**Defined.** A raw string with no closing `'` followed by the right number of `#` is a parse error, `nu::parser::unexpected_eof`. `[strings.raw.unclosed]`

**Changes in 0.117.0** ([#19271](https://github.com/nushell/nushell/pull/19271)): the error is `nu::parser::unclosed_delimiter`.

## Backtick-quoted strings

**Defined.** A backtick-quoted string starts and ends with `` ` ``. It processes no escape sequences and no interpolation. It may contain spaces and `'`. Used as an argument, a list item or a record key, it is a string. A pair of backticks inside the string (as in ` ```` `) is part of the string. `[strings.backtick.syntax]`

**Defined.** A backtick-quoted string at the start of an expression is a command name, like a bare word. This includes the right-hand side of `let`, so ``let x = `a b` `` runs a command named `a b`. If no such command exists, it is a runtime error, `nu::shell::external_command`. `[strings.backtick.command-position]`

**Defined.** A backtick-quoted string with no closing `` ` `` is a parse error, `nu::parser::unclosed_delimiter`. `[strings.backtick.unclosed]`

**Defined.** There is no interpolated backtick string. `` $`a` `` is parsed as a variable reference and fails with `nu::parser::variable_not_found`. `[strings.backtick.no-interpolation-form]`

## Bare words

**Defined.** A bare word, a word written without quotes, is a string when used as an argument or as a list item. Bare words may contain characters such as `-`, `.` and `/`. `[strings.bare.syntax]`

**Defined.** The bare words `true`, `false` and `null` are not strings, but values of their own types. A bare word that only starts with one of them, such as `trueX`, is a string. A bare word that starts with digits but isn't a number, such as `1abc`, is a string. `[strings.bare.keywords]`

**Defined.** A bare word at the start of a pipeline is a command name. If no such command exists, it is a runtime error, `nu::shell::external_command`. `[strings.bare.command-position]`

## Quoted strings in command position

**Defined.** A single-quoted or double-quoted string at the start of a pipeline is a value, not a command name. This differs from bare words and backtick-quoted strings. `[strings.quoted.command-position]`

## Adjacent quotes

**Defined.** Two strings with the same kind of quote written next to each other with no space between them, such as `'a''b'` or `"a""b"`, form a single string that keeps the quote characters: `a''b` and `a""b`. `[strings.adjacent.same-quote]`

**Confirmed** ([#1](https://github.com/Fikoko/nu-conformance/issues/1)): intended: a quoted word runs to its last quote of the same kind, and the inner quotes are kept.

**Defined.** A quoted string followed directly by a bare word or a string with a different kind of quote, such as `'a'b` or `'a'"b"`, is a parse error, `nu::parser::extra_token_after_closing_delimiter`. `[strings.adjacent.other]`

## Interpolated strings

**Defined.** An interpolated string is written `$"..."` or `$'...'`. It may contain no expressions, in which case it is an ordinary string. `[strings.interp.syntax]`

**Defined.** In an interpolated string, an expression in parentheses is evaluated and its value, converted to a string, replaces the parentheses. Several expressions may appear. If the parentheses hold several pipelines separated by `;`, the value of the last one is used. Empty parentheses produce nothing. The result is a `string`. `[strings.interp.expr]`

**Defined.** Only parentheses start an expression. `{...}` and `$name` without parentheses are kept as written. `[strings.interp.only-parens]`

**Defined.** `$"..."` processes the same escape sequences as a double-quoted string. `[strings.interp.double-escapes]`

**Defined.** In `$"..."`, `\(` produces a literal `(` and stops the following text from being evaluated. The matching `)` doesn't need to be escaped. `[strings.interp.escaped-paren]`

**Defined.** In both `$"..."` and `$'...'`, a `)` with no matching `(` is an ordinary character. `[strings.interp.unmatched-close]`

**Defined.** `$'...'` processes no escape sequences. A backslash is an ordinary character, even before `(`, so the parentheses after it are still evaluated. `[strings.interp.single-no-escapes]`

**Defined.** The expression inside the parentheses may contain other strings, including double-quoted, single-quoted and interpolated strings. `[strings.interp.nesting]`

**Defined.** Integers, floats, booleans and durations are converted to the same text as `into string` produces. `[strings.interp.value-to-string]`

**Defined.** `null` is converted to an empty string. `[strings.interp.null]`

**Implementation-defined.** How a filesize is converted depends on configuration. With the default configuration, `2kb` becomes `2.0 kB`. `[strings.interp.filesize]`

**Implementation-defined.** Lists, records, ranges and binary values are converted to a text form, such as `[1, 2, 3]` for a list and `{a: 1}` for a record. `into string` behaves differently for these values: it converts each list item separately and rejects records and binary values. `[strings.interp.structured]`

**Confirmed** ([#1](https://github.com/Fikoko/nu-conformance/issues/1)): intended: interpolation shows a value's display form.

**Defined.** An interpolated string can be the value of a `const` and is then evaluated when the code is parsed. `[strings.interp.const]`

**Defined.** If an expression inside the parentheses fails, the interpolated string fails with the same error. `[strings.interp.errors]`

**Defined.** An interpolated string with no closing quote, or with an opening `(` that has no matching `)`, is a parse error, `nu::parser::unclosed_delimiter`. `[strings.interp.unclosed]`
