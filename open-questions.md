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

## Types

### T1. Infinity compares as equal to every number

Rule: [`types.float.infinity-compare`](rules/types.md)

```nu
inf == 1        # => true
inf == -inf     # => true
inf > 1         # => false
1 < inf         # => false
[1.0 inf] | math max   # => 1.0
```

This looks like a bug. Under IEEE 754, `inf > 1` is `true` and `inf == 1` is `false`. `sort` already orders infinity correctly, so the comparison operators and `math max` seem to use a different code path.

### T2. There is no unary minus for expressions

Rule: [`types.minus.literal-only`](rules/types.md)

```nu
-(2 + 3)            # => "-5" (a string)
let x = 5; -$x      # => "-$x" (a string)
0 - $x              # => -5
```

A `-` before a parenthesized expression or a variable gives a string instead of negating, and there is no error. Is a unary minus planned, or should these at least be errors?

### T3. A sign makes hex, octal and binary literals into strings

Rule: [`types.int.radix-sign`](rules/types.md)

```nu
-100 | describe     # => int
-0x10 | describe    # => string
+0b11               # => runs a command named `+0b11`
```

Should `-0x10` be `-16`, or a parse error?

### T4. Out-of-range integer literals become floats

Rule: [`types.int.too-large`](rules/types.md)

```nu
9223372036854775807 | describe    # => int
9223372036854775808 | describe    # => float
9223372036854775807 + 1           # => Error: nu::shell::operator_overflow
```

A literal one past the largest integer silently becomes a float and loses precision, while arithmetic that overflows is an error. Should the literal be an error too?

### T5. Underscores are accepted almost anywhere in numbers

Rule: [`types.int.underscores`](rules/types.md)

```nu
[1_ 1__0 _1 0x_ff] | to nuon    # => [1, 10, 1, 255]
```

Digit separators in most languages must sit between digits. Is accepting a leading, trailing or doubled underscore intended?

### T6. `inf` and `nan` ignore case, but `true` and `null` don't

Rules: [`types.float.special-case`](rules/types.md), [`types.bool.literals`](rules/types.md), [`types.nothing.literal`](rules/types.md)

```nu
[INF NAN] | to nuon             # => [inf, NaN]
[True NULL] | each { describe } # => [string, string]
```

Should the float names be case-sensitive like the other keywords?

### T7. Literals just past the 64-bit limit saturate instead of failing

Rules: [`types.duration.range`](rules/types.md), [`types.filesize.range`](rules/types.md)

```nu
9223372036854775808ns | to nuon   # => 9223372036854775807ns (silently the largest value)
106752day                         # => Error: nu::compile::invalid_literal
8EiB | to nuon                    # => 9223372036854775807b (silently the largest value)
10EiB                             # => Error: nu::compile::invalid_literal
```

The limit check seems to let through values exactly at 2^63, which then saturate. This may be the same floating-point comparison issue in both places.

### T8. Invalid dates silently become strings

Rule: [`types.datetime.invalid`](rules/types.md)

```nu
[2024-02-29] | describe    # => list<datetime>
[2023-02-29] | describe    # => list<string>
2023-02-29                 # => runs a command named `2023-02-29`
```

A typo in a date literal gives a string instead of an error. Should something that looks like a date but isn't valid be a parse error?

### T9. Duration units are case-sensitive, filesize units are not

Rules: [`types.duration.units`](rules/types.md), [`types.filesize.case-insensitive`](rules/types.md)

```nu
[1KIB 1kib] | to nuon     # => [1024b, 1024b]
[1Sec 1SEC] | describe    # => list<string>
```

Should the two kinds of unit follow the same rule?

### T10. `+` works on plain numbers but not on durations or filesizes

Rules: [`types.duration.sign`](rules/types.md), [`types.filesize.literal`](rules/types.md)

```nu
+50 | describe       # => int
[+5sec] | describe   # => list<string>
[+1kB] | describe    # => list<string>
```

This is related to T3: a sign is accepted in some literal forms and not others.

### T11. A stray `]` becomes part of a list item

Rule: [`types.list.extra-close`](rules/types.md)

```nu
[1 2]] | to nuon    # => [1, "2]"]
```

An extra closing bracket silently turns the last item into a string instead of being reported. Should this be a parse error?

### T12. Which bare words can be record keys and column names

Rules: [`types.record.keys`](rules/types.md), [`types.table.literal`](rules/types.md)

```nu
{1: one} | columns   # => ["1"]
{true: 1}            # => Error: nu::parser::parse_mismatch_with_full_string_msg
[[1 2]; [3 4]]       # => Error: nu::parser::error (must be a string)
```

A number works as a record key but not as a table column name, and `true` and `null` work as neither. Should these follow one rule?

### T13. Duplicate keys in a literal are found at runtime

Rules: [`types.record.duplicate-keys`](rules/types.md), [`types.table.duplicate-header`](rules/types.md)

```nu
print before; {a: 1, a: 2}
# => before
# => Error: nu::shell::column_defined_twice
```

The duplicate is visible in the source, but the error only comes when the record is evaluated, after earlier code has run. Should duplicate literal keys be a parse error?

### T14. A table literal can't have zero rows

Rule: [`types.table.literal`](rules/types.md)

```nu
[[a b];]    # => Error: nu::parser::parse_mismatch (expected table row)
```

There is no literal for an empty table with named columns. Is that intended?
