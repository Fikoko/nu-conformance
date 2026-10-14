# Types

Draft rules for the [Types](https://www.nushell.sh/lang-guide/chapters/types/00_types_overview.html) chapter of the lang guide. It covers integers, floats, booleans, `nothing` (null), durations, filesizes, datetimes, ranges and binary values. Where the lang guide links to the Book's [Types of Data](https://www.nushell.sh/book/types_of_data.html), the Book's examples are tested too.

**Checked against:** Nushell 0.116.1.

Some examples on these pages use operators (`/`, `//`, `mod`, `==`). They are tested here because the type pages document them. The full rules for operators belong to the Operators chapter.

Paragraphs marked **Open question** describe current behavior that may not be intended. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** Every value has a type. This chapter covers the types `int`, `float`, `bool`, `nothing`, `duration`, `filesize`, `datetime`, `range` and `binary`. `describe` reports a value's type by these names. `[types.intro]`

## Integers

**Defined.** An integer literal is a sequence of decimal digits, optionally preceded by `+` or `-`. Leading zeros are allowed and don't change the value, so `007` is `7`. `-0` is `0`. The value has type `int`. `[types.int.decimal]`

**Defined.** An integer literal may instead be written in hexadecimal after `0x`, octal after `0o`, or binary after `0b`. Hex digits may be upper or lower case. `[types.int.radix]`

**Defined.** The prefixes `0x`, `0o` and `0b` must be lower case. `0X10` is not a number: in a list it is a string. `[types.int.radix-prefix-case]`

**Defined.** Inside a list, a literal with a valid prefix but a digit that isn't valid for it, such as `0o8`, `0b2` or `0xg`, is a parse error, `nu::parser::error`. `[types.int.radix-invalid]`

**Defined.** A sign is only allowed on decimal literals. `-0x10`, `-0b11`, `-0o7` and `+0b11` are strings, not numbers. `[types.int.radix-sign]`

**Open question:** `-100` is an integer but `-0x10` is the string `"-0x10"`, which is easy to miss. Assigning it to an `int` variable is a type error, but using it elsewhere silently gives a string.

**Defined.** An underscore may appear anywhere in an integer literal, including next to the prefix, more than once in a row, and at the start or end. It is ignored, so `1_000_000` is `1000000` and `0x_ff` is `255`. `[types.int.underscores]`

**Open question:** underscores are accepted in more places than digit separators usually are. `1_`, `1__0` and `_1` are all integers.

**Defined.** An integer is a signed 64-bit value. The largest is `9223372036854775807` and the smallest is `-9223372036854775808`. `[types.int.range]`

**Defined.** A decimal integer literal outside that range is not an error. It becomes a `float`. Assigning it to a variable declared `int` is a parse error, `nu::parser::type_mismatch`. `[types.int.too-large]`

**Open question:** an out-of-range literal silently changes type and loses precision. Arithmetic that goes out of range is an error instead ([`types.int.overflow`](#integer-arithmetic)).

**Defined.** A hex literal may use all 64 bits. Its bits are read as a two's-complement value, so `0x8000000000000000` is the smallest integer and `0xffffffffffffffff` is `-1`. `[types.int.radix-range]`

### Integer arithmetic

**Defined.** Integer arithmetic does not wrap around. An addition, subtraction, multiplication or division whose result is outside the 64-bit range is a runtime error, `nu::shell::operator_overflow`. `[types.int.overflow]`

**Defined.** `/` always returns a `float`, even when both operands are integers and the result is whole. `//` is floor division and returns an `int`, rounding toward negative infinity. `mod` uses the same floor rule, so its result has the sign of the divisor. `[types.int.division]`

**Defined.** Dividing an integer by zero with `/` or `//` is a runtime error, `nu::shell::division_by_zero`. `[types.int.division-by-zero]`

## The minus sign

**Defined.** A leading `-` makes a number negative only as part of a number literal. Before a parenthesized expression or a variable, it doesn't negate: `-(2 + 3)` is the string `"-5"` and `-$x` is the string `"-$x"`. Subtracting from zero (`0 - $x`) negates a value. `[types.minus.literal-only]`

**Open question:** there is no unary minus for expressions, and the result is a string rather than an error, so a mistake can go unnoticed.

## Floats

**Defined.** A float literal is a decimal number containing a `.`, optionally preceded by `+` or `-`. Digits may be left out on either side of the point, so `.5` is `0.5` and `5.` is `5.0`. The value has type `float`. `[types.float.decimal]`

**Defined.** A float literal may have an exponent: `e` or `E`, an optional `+` or `-`, and decimal digits. A number with an exponent is a float even without a `.`, so `1e3` is `1000.0`. Without digits after `e`, as in `1e`, it is not a number. `[types.float.exponent]`

**Defined.** Underscores may appear in the integer part, the fractional part and the exponent of a float literal, and are ignored. `[types.float.underscores]`

**Defined.** A float is always written with a decimal point, even when it has no fractional part, so `10 / 2` is `5.0`. `[types.float.display]`

**Defined.** A float is an IEEE 754 double-precision (64-bit) value, and arithmetic on floats is rounded the same way. For example, `0.1 + 0.2` is `0.30000000000000004`. `[types.float.precision]`

**Defined.** Floats and integers can be compared with each other by value, so `2.0 == 2` is `true`. `[types.float.int-compare]`

**Defined.** `Infinity` and `inf` are positive infinity, and `NaN` and `nan` are not-a-number. With a leading `-`, `-Infinity` and `-inf` are negative infinity. These are floats. `[types.float.special]`

**Defined.** The names `inf`, `infinity` and `nan` are matched ignoring case, so `INF` and `NAN` are also floats. `[types.float.special-case]`

**Open question:** these names ignore case, but `true`, `false` and `null` don't (`True` and `NULL` are strings).

**Defined.** A float literal too large to represent becomes infinity, so `1e309` is `inf`. A literal too small to represent becomes `0.0`. `[types.float.literal-range]`

**Defined.** `-0.0` is negative zero and is written as `-0.0`. `[types.float.negative-zero]`

**Defined.** `NaN` is not equal to anything, including itself, and is not greater than anything. `[types.float.nan-compare]`

**Defined.** Arithmetic with infinity follows IEEE 754, so `inf + 1` is `inf`. `[types.float.infinity-arithmetic]`

**Defined.** Comparing infinity with another number gives these results today: `==` is `true` for any number, including `-inf`, and `<` and `>` are `false`. `[types.float.infinity-compare]`

**Open question:** this looks like a bug. In IEEE 754, `inf > 1` is `true` and `inf == 1` is `false`. It also affects commands that compare values, for example `[1.0 inf] | math max` returns `1.0`, while `sort` orders infinity correctly.

**Defined.** Dividing a float by zero is a runtime error, `nu::shell::division_by_zero`. It does not produce infinity or `NaN`. `[types.float.division-by-zero]`

## Booleans

**Defined.** `true` and `false` are the two values of type `bool`. They are case-sensitive: `True`, `TRUE` and `False` are strings. `[types.bool.literals]`

**Defined.** Comparisons produce a `bool`, which can be stored in a variable declared `bool` or used as the condition of `if`. `[types.bool.comparison]`

**Defined.** A `bool` is not a number. `true == 1` is `false`. `[types.bool.not-int]`

## Nothing

**Defined.** `null` is the only value of type `nothing`. It is case-sensitive: `Null` and `NULL` are strings. `null` is equal to itself. `[types.nothing.literal]`

**Defined.** When the result of a script or pipeline is `null`, nothing is printed. `[types.nothing.prints-nothing]`

**Defined.** An expression that produces no value produces `null`. For example, `if` without `else` when the condition is false, and `print`. `[types.nothing.no-value]`

**Defined.** A cell path member followed by `?` is optional. If that member is missing, the result is `null` instead of an error. `[types.nothing.optional-access]`

**Defined.** Accessing a missing column without `?` is a runtime error, `nu::shell::column_not_found`. A missing value is not `null`. `[types.nothing.missing-value]`

## Durations

**Defined.** A duration literal is a number (integer or decimal, optionally with `-`, underscores or an exponent) followed immediately by a duration unit, with no space. The value has type `duration` and is stored as a whole number of nanoseconds. `[types.duration.literal]`

**Defined.** The duration units are `ns`, `us` (also `µs` or `μs`), `ms`, `sec`, `min`, `hr`, `day` and `wk`. Units are case-sensitive, so `1Sec` is not a duration. There are no month or year units, because their length varies. `[types.duration.units]`

**Defined.** A duration literal can't start with `+`. `+5sec` is not a duration. `[types.duration.sign]`

**Defined.** A fractional duration that isn't a whole number of nanoseconds is truncated toward zero, so `1.5ns` is `1ns` and `0.5ns` is `0ns`. `[types.duration.precision]`

**Defined.** A duration is a signed 64-bit count of nanoseconds. A literal far outside that range is a compile error, `nu::compile::invalid_literal`. `[types.duration.range]`

**Open question:** a literal just past the limit doesn't fail. `9223372036854775808ns` silently becomes the largest duration, while `106752day` is an error.

**Defined.** Converted to a string, a duration is broken down into its units from largest to smallest, leaving out units that are zero, for example `3day 3hr 21min 36sec`. A negative duration has a single `-` at the start. A zero duration is `0sec`. `[types.duration.display]`

**Defined.** A duration can be multiplied or divided by a number, giving a duration. A duration divided by a duration gives a `float` with `/` and an `int` with `//`, and `mod` gives a duration. Durations can be compared. Adding a plain number to a duration is a parse error, `nu::parser::operator_incompatible_types`. `[types.duration.arithmetic]`

## Filesizes

**Defined.** A filesize literal is a number (integer or decimal, optionally with `-`, underscores or an exponent) followed immediately by a filesize unit. The value has type `filesize` and is stored as a whole number of bytes, truncating any fraction. A filesize literal can't start with `+`. `[types.filesize.literal]`

**Defined.** The decimal units are `B`, `kB`, `MB`, `GB`, `TB`, `PB` and `EB`, each 1000 times the one before. `[types.filesize.decimal-units]`

**Defined.** The binary units are `KiB`, `MiB`, `GiB`, `TiB`, `PiB` and `EiB`, each 1024 times the one before. `[types.filesize.binary-units]`

**Defined.** Filesize units are case-insensitive, so `1KiB`, `1kib` and `1KIB` are equal, and `1b` is one byte. `[types.filesize.case-insensitive]`

**Open question:** filesize units ignore case, but duration units don't (`1Sec` is not a duration).

**Defined.** Inside a list, a number followed by letters ending in `b` or `B` that aren't a known unit, such as `1ZB`, is a parse error, `nu::parser::error`. `[types.filesize.unknown-unit]`

**Defined.** A filesize is a signed 64-bit count of bytes. A literal far outside that range is a compile error, `nu::compile::invalid_literal`. `[types.filesize.range]`

**Open question:** as with durations, a literal just past the limit doesn't fail. `8EiB` (exactly 2^63 bytes) silently becomes the largest filesize, while `10EiB` is an error.

**Implementation-defined.** How a filesize is converted to a string depends on configuration. With the default configuration it uses decimal units with one decimal place, so `1500B` becomes `1.5 kB` and `1GiB` becomes `1.0 GB`. `[types.filesize.display]`

**Defined.** A filesize can be multiplied or divided by a number, giving a filesize. A filesize divided by a filesize gives a `float`. Filesizes in different units compare by their number of bytes. Adding a plain number to a filesize is a parse error, `nu::parser::operator_incompatible_types`. `[types.filesize.arithmetic]`

## Datetimes

**Defined.** A datetime literal is an RFC 3339 date, `YYYY-MM-DD`, optionally followed by `T` (or `t`) and a time `hh:mm:ss`, optional fractional seconds, and an optional offset `Z` or `±hh:mm`. Without a time, the time is midnight. Without an offset, the value is in UTC. The value has type `datetime`. `[types.datetime.literal]`

**Defined.** A literal that looks like a date but isn't a valid one, such as `2022-02-30`, `2022-2-2`, a time without seconds, or an offset without `:`, is not a datetime. In a list it is a string. A date with a leading `-` is a string, and eight digits without dashes are an integer. A space between the date and the time is a parse error, `nu::parser::parse_mismatch`. `[types.datetime.invalid]`

**Open question:** an invalid date silently becomes a string rather than an error, so a typo like `2023-02-29` may go unnoticed.

**Defined.** Adding a duration to a datetime gives a datetime, and subtracting two datetimes gives a duration. Datetimes compare by the moment in time they represent, so the same moment in different offsets is equal. Adding a plain number to a datetime is a parse error, `nu::parser::operator_incompatible_types`. `[types.datetime.arithmetic]`

## Ranges

**Defined.** A range is written `start..end`, with no spaces around `..`. The bounds may be number literals, variables or parenthesized expressions. The value has type `range`. `[types.range.literal]`

**Defined.** A range includes its end value. `[types.range.inclusive]`

**Defined.** A range written with `..<` stops before its end value. It also works with a second value and in descending ranges. `[types.range.exclusive]`

**Defined.** A range written `start..second..end` steps by the distance between `start` and `second`. Without a second value, the step is `1`, or `-1` when the end is less than the start. Values past the end are not included. `[types.range.step]`

**Defined.** A range whose step is zero, or whose step moves away from the end, can't be used. It is a runtime error, `nu::shell::range_to_countable`. `[types.range.bad-step]`

**Defined.** If any bound is a float, the range produces floats. `[types.range.float]`

**Defined.** A float range without a second value whose start and end are less than `1` apart steps by a power of ten based on the size of the difference, so `0.1..0.3` steps by `0.1` and `0.0..0.05` steps by `0.01`. `[types.range.float-small-step]`

**Defined.** The start of a range is optional and defaults to `0`. The end is optional, and a range without an end is infinite. `[types.range.open]`

**Defined.** A range is lazy: its values are produced only when needed. A range stays a `range` when stored in a variable, passed through `collect` or put in a list, and two ranges with the same bounds are equal. Commands such as `each` produce a list from it. `[types.range.lazy]`

## Binary

**Defined.** A binary literal is `0x[...]` with hex digits, `0o[...]` with octal digits, or `0b[...]` with binary digits. Hex digits may be upper or lower case. The value has type `binary`. `0x[]` is empty. `[types.binary.literal]`

**Defined.** Spaces and commas inside the brackets are ignored. `[types.binary.separators]`

**Defined.** If the digits don't make up a whole number of bytes, the value is padded with zeros on the left. Padding applies to the literal as a whole, after separators are removed, so `0x[1 23]` is `0x[0123]`. `[types.binary.padding]`

**Defined.** In an octal binary literal, each byte is three octal digits from `000` to `377`. More digits than fit, or a value above `377`, is a parse error, `nu::parser::invalid_binary_string`. `[types.binary.octal-bytes]`

**Defined.** A digit not valid for the prefix, an underscore, or a nested prefix such as `0x[0x01]` is a parse error, `nu::parser::invalid_binary_string`. A missing `]` is a parse error, `nu::parser::unclosed_delimiter`. `[types.binary.invalid]`

**Defined.** Binary values are joined with `++`. `+` is not supported for binary and is a parse error, `nu::parser::operator_unsupported_type`. `[types.binary.arithmetic]`
