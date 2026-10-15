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

## Operators

### O1. `not` binds tighter than documented

Rule: [`operators.not.operand`](rules/operators.md)

```nu
not ("a" == "b")    # => true
not "a" == "b"      # => Error: nu::shell::cant_convert (can't convert string to boolean)
let x = 1; not $x == 2   # => same error
```

The lang guide, the Book and `help operators` all list `not` (precedence 55) below the comparison operators (80), so `not "a" == "b"` should mean `not ("a" == "b")`. The parser applies `not` to the next value only. Should the parser change, or the documentation?

### O2. Ordering against `null` gives `null`

Rule: [`operators.compare.null`](rules/operators.md)

```nu
null < 1 | describe    # => nothing
let x = null; if $x < 5 { "small" }   # => Error: nu::shell::cant_convert
null == 1              # => false
```

`==` and `!=` with `null` give a boolean, but `<`, `<=`, `>` and `>=` give `null`, and the error only appears where the result is used. Should these give `false`, or an error at the comparison?

### O3. The smallest integer `mod -1` overflows

Rule: [`operators.arith.overflow`](rules/operators.md)

```nu
(-9223372036854775808) mod -1   # => Error: nu::shell::operator_overflow
```

The result is `0`, which fits in 64 bits. The error comes from the underlying integer remainder check. Is it intended?

### O4. `in` is stricter about number types than `==`

Rule: [`operators.member.types`](rules/operators.md)

```nu
1 == 1.0          # => true
[1] == [1.0]      # => true
1 in [1.0]        # => Error: nu::parser::operator_incompatible_types
```

Integers and floats compare equal everywhere else. Should `in` accept an integer in a list of floats (and the reverse)?

## Declarations and scope

### D1. `unlet` on a constant does nothing

Rule: [`declarations.unlet.const`](rules/declarations.md)

```nu
const x = 1; unlet $x; $x    # => 1
let y = 1; unlet $y; $y      # => Error: nu::shell::variable_not_found
```

There is no error, and the constant is still there. Should `unlet` delete constants, or reject them?

### D2. `unlet $in` is accepted

Rule: [`declarations.unlet.builtins`](rules/declarations.md)

```nu
unlet $nu    # => Error: nu::compile::invalid_literal
unlet $in    # => no error
```

The lang guide says `$in` is a built-in variable that can't be deleted.

### D3. `where` can use `mut` variables, unlike other closures

Rule: [`scope.closure.where`](rules/scope.md)

```nu
mut x = 1
[1 2] | where {|v| $v > $x }   # => [2]
[1 2] | each {|v| $v > $x }    # => Error: nu::parser::expected_keyword (capture of mutable variable)
```

The lang guide lists `where` among the commands whose closures can't capture `mut` variables. Is `where` meant to be an exception?

### D4. List item types in annotations are checked only at runtime

Rule: [`declarations.let.annotation-items`](rules/declarations.md)

```nu
let x: int = "ten"            # => Error: nu::parser::type_mismatch
let x: list<int> = [1 "a"]    # => Error: nu::shell::type_mismatch (at runtime)
```

The item types of the literal are known while parsing. Should this be a parse error too?

## Flow control

### F1. `for` over a record runs once with the whole record

Rule: [`flow.for.single-value`](rules/flow.md)

```nu
for x in {a: 1, b: 2} { print ($x | to nuon) }   # => {a: 1, b: 2} (one iteration)
for x in 5 { print $x }                           # => 5 (one iteration)
for x in null { print $x }                        # => (no iterations)
```

Anything that isn't a list, range or table is iterated as a single item, and `null` as no items. Is that intended, or should a record iterate over its key-value pairs, and other values be an error?

### F2. `for` can't start a pipeline, but `while` and `loop` can

Rule: [`flow.for.statement`](rules/flow.md)

```nu
while false { } | describe      # => nothing
loop { break } | describe       # => nothing
for x in [1] { } | describe     # => Error: nu::parser::unexpected_keyword
```

All three are statements that produce `null`. Should they follow the same rule?

### F3. A non-boolean condition gives different errors in `if` and `while`

Rules: [`flow.if.condition`](rules/flow.md), [`flow.while.condition`](rules/flow.md)

```nu
if 1 { }       # => Error: nu::shell::cant_convert
while 1 { }    # => Error: nu::shell::type_mismatch
```

The same mistake gives two different error codes. Should they be the same?

### F4. A float inside an integer range doesn't match a range pattern

Rule: [`flow.match.range-values`](rules/flow.md)

```nu
match 1.5 { 1..2 => 'in', _ => 'out' }   # => out
1.5 in 1..2                              # => false
```

The lang guide says a range pattern matches "a number inside the range". Should `1.5` match `1..2`, or should the guide say the pattern matches only the values the range produces?

### F5. `match` compares by type, except for integers and floats

Rule: [`flow.match.literals`](rules/flow.md)

```nu
match "3" { 3 => 'int', "3" => 'string' }    # => string
match 1.0 { 1 => 'int one', _ => 'other' }    # => int one
```

The lang guide says values are compared "by type as well as value". Integers and floats match each other by value, as with `==`. Should the guide mention this exception?

## Custom commands

### C1. A parameter after `...rest` takes the first argument

Rule: [`commands.params.after-rest`](rules/commands.md)

```nu
def f [...r, a] { {r: $r, a: $a} }
f 1 2 3    # => {r: [2, 3], a: 1}
```

The signature reads as if `a` were the last argument, but it receives the first. Should a parameter after the rest parameter be a parse error?

### C2. Duplicate parameters and short flags are accepted

Rule: [`commands.params.duplicates`](rules/commands.md)

```nu
def f [a, a] { $a }; f 1 2                            # => 2
def f [--x (-x), --y (-x)] { [$x $y] }; f -x          # => [true, false]
def f [--help] { 'mine' }; f --help                   # => shows the built-in help
```

These look like mistakes in the signature, but none is reported. Should they be parse errors?
