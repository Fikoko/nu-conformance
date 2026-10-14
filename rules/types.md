# Types

Draft rules for the [Types](https://www.nushell.sh/lang-guide/chapters/types/00_types_overview.html) chapter of the lang guide. This part covers integers, floats, booleans and `nothing` (null). Where the lang guide links to the Book's [Types of Data](https://www.nushell.sh/book/types_of_data.html), the Book's examples are tested too.

**Checked against:** Nushell 0.116.1.

Some examples on these pages use operators (`/`, `//`, `mod`, `==`). They are tested here because the type pages document them. The full rules for operators belong to the Operators chapter.

Paragraphs marked **Open question** describe current behavior that may not be intended. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** Every value has a type. This part covers the types `int`, `float`, `bool` and `nothing`. `describe` reports a value's type by these names. `[types.intro]`

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
