# Open questions

Behavior that the tests record as it is today, but that may not be intended. Each question links to the rule that describes the current behavior. None of these are decided here; they are for the Nushell maintainers ([D2](design-decisions.md#d2-describe-current-behavior-dont-prescribe)).

If the maintainers decide to change one, the affected tests get the new expected result and `status: pending` until a release implements it.

All behavior below was checked against Nushell 0.116.1.

## Strings

### S1. Adjacent quotes keep the quote characters

Rule: [`strings.adjacent.same-quote`](rules/strings.md)

```nu
'a''b' | to nuon    # => "a''b"
"a""b" | to nuon    # => "a\"\"b"
'a'b                # => Error: nu::parser::extra_token_after_closing_delimiter
'a'"b"              # => Error: nu::parser::extra_token_after_closing_delimiter
```

Two same-kind quoted strings written together become one string that contains the quotes, while every other combination is an error. Is `'a''b'` meant to be accepted? If so, should the result be `a''b`, or should it be an error like the others?

### S2. Invalid UTF-8 from `\x` escapes gives an unclear error

Rule: [`strings.double-quoted.escapes.hex-utf8`](rules/strings.md)

```nu
"\xFF"
# => Error: nu::parser::parse_mismatch
# =>   × Parse mismatch: expected any shape.
```

Every other bad escape gives `nu::parser::error` with a message naming the problem (for example "invalid hex escape"). This one gives a generic parse mismatch. Should it report that the bytes are not valid UTF-8, and with which code?

### S3. Unclosed raw strings use a different error code

Rule: [`strings.raw.unclosed`](rules/strings.md)

```nu
"abc     # => nu::parser::unclosed_delimiter
'abc     # => nu::parser::unclosed_delimiter
`abc     # => nu::parser::unclosed_delimiter
$"abc    # => nu::parser::unclosed_delimiter
r#'abc   # => nu::parser::unexpected_eof
```

Should an unclosed raw string also be `unclosed_delimiter`?

### S4. Binary values in interpolation become a list of numbers

Rule: [`strings.interp.structured`](rules/strings.md)

```nu
$"(0x[01 ff])"          # => "[1, 255]"
0x[01 ff] | into string # => Error: nu::shell::cant_convert
```

Interpolation turns a binary value into the text of a list of byte values. `into string` refuses to convert binary at all. More generally, interpolation and `into string` disagree for lists, records and binary values. Which conversions are intended to be stable?

### S5. A backtick string after `let =` runs a command

Rule: [`strings.backtick.command-position`](rules/strings.md)

```nu
let x = `a b`
# => Error: nu::shell::external_command — Command `a b` not found
let x = 'a b'    # works, $x is "a b"
```

This matches the Book ("a backtick-quoted string in the first position of an expression will be interpreted as a command"), but it may surprise people who use backticks as a way to quote text with spaces. Is this intended?
