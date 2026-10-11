# Strings

Draft rules for the [Strings and Text Formatting](https://www.nushell.sh/lang-guide/chapters/strings_and_text.html) chapter of the lang guide.

**Checked against:** Nushell 0.116.1. This chapter is a seed for Phase 1 and covers only a few rules so far.

r[strings.intro]
**Defined.** A string is a sequence of characters. Nushell has several kinds of string literal, which differ in how they are delimited and whether they process escape sequences and interpolation.

## Double-quoted strings

r[strings.double-quoted.escapes]
**Defined.** In a double-quoted string, a backslash starts an escape sequence. `\t` produces a tab character.

r[strings.double-quoted.unclosed]
**Defined.** A double-quoted string with no closing `"` is a parse error, reported as `nu::parser::unclosed_delimiter`.

## Single-quoted strings

r[strings.single-quoted.no-escapes]
**Defined.** In a single-quoted string, a backslash is an ordinary character. No escape sequences are processed.

## Raw strings

r[strings.raw.delimiters]
**Defined.** A raw string starts with `r#'` and ends with `'#`. Single quotes may appear inside it.

## Interpolation

r[strings.interp.expr]
**Defined.** In an interpolated string (`$"..."`), an expression in parentheses is evaluated and its value replaces the parentheses.
