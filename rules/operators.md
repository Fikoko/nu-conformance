# Operators

Draft rules for the [Operators](https://www.nushell.sh/lang-guide/chapters/operators.html) chapter of the lang guide, and the Book's [Operators](https://www.nushell.sh/book/operators.html) page it points to. This part covers arithmetic, comparison, bitwise and boolean operators and their precedence. String, membership and regex operators, assignment and spread are in part 2.

**Checked against:** Nushell 0.116.1.

Some rules about operators on specific types are in the [Types](types.md) chapter, for example integer overflow, division by zero and arithmetic on durations.

Paragraphs marked **Open question** describe current behavior that may not be intended. The rules record what `nu` does today, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** An operator combines the values on either side of it, or, for `not`, the value after it. Many type errors in operators are found while parsing, before the code runs. `[operators.intro]`

**Defined.** A binary operator must have whitespace on both sides. Without it, the characters form a single word, so `1+2` is a command name. With whitespace on only one side, as in `1 +2`, it is a parse error, `nu::parser::parse_mismatch`. A `-` directly before a number makes it a negative literal, so `1 + -2` is `-1`. `[operators.spacing]`

## Arithmetic

**Defined.** `+`, `-` and `*` on two integers give an integer. `/` always gives a float. Operators at the same precedence level are evaluated from left to right, except `**`. `[operators.arith.basic]`

**Defined.** If either side of an arithmetic operator is a float and the other is an integer, the result is a float. `[operators.arith.mixed]`

**Defined.** `//` divides and rounds toward negative infinity. `mod` gives the remainder of that division, so its result has the sign of the divisor. With a float operand, both give a float. `[operators.arith.floor]`

**Defined.** `**` raises to a power. Two integers give an integer, and `0 ** 0` is `1`. A float on either side gives a float. A negative integer exponent with an integer base is a runtime error, `nu::shell::incorrect_value`. `**` groups from right to left, so `2 ** 3 ** 2` is `2 ** 9`. `[operators.arith.pow]`

**Defined.** `mod` and `//` by zero are runtime errors, `nu::shell::division_by_zero`, for both integers and floats. `[operators.arith.division-by-zero]`

**Defined.** `**` and `mod` on integers raise `nu::shell::operator_overflow` when the result doesn't fit in 64 bits. This includes the smallest integer `mod -1`. `[operators.arith.overflow]`

**Open question:** `-9223372036854775808 mod -1` is mathematically `0`, which fits, but it is an overflow error.

**Defined.** Arithmetic on types that don't support it, such as strings, lists, `null` and booleans, is a parse error, `nu::parser::operator_unsupported_type`. Arithmetic between two types that each support it but not together, such as a string and an integer, or a float and a duration, is a parse error, `nu::parser::operator_incompatible_types`. `[operators.arith.types]`

## Comparison

**Defined.** `==` and `!=` work on values of any type. Values of different types are never equal, except integers and floats, which compare by value. So `1 == "1"` and `null == false` are `false`. `[operators.compare.equality]`

**Defined.** `<`, `<=`, `>` and `>=` order numbers by value, strings by their bytes (so `"B" < "a"` and `"10" < "9"`), and booleans with `false` before `true`. `[operators.compare.ordering]`

**Defined.** Lists, records, binary values and ranges have no order. Using `<`, `<=`, `>` or `>=` on them is a parse error, `nu::parser::operator_unsupported_type`. `[operators.compare.unordered]`

**Defined.** Ordering values of two types that can't be compared, such as an integer and a string, is a parse error, `nu::parser::operator_incompatible_types`. Comparisons don't chain: `1 < 2 < 3` compares `true` with `3`, which is the same error. `[operators.compare.incompatible]`

**Defined.** If either side of `<`, `<=`, `>` or `>=` is `null`, the result is `null`, not a boolean. Using that result as a condition is a runtime error, `nu::shell::cant_convert`. `[operators.compare.null]`

**Open question:** ordering against `null` gives neither `true`, `false` nor an error. `$x < 5` with `$x` null only fails later, where the result is used.

## Bitwise

**Defined.** `bit-and`, `bit-or` and `bit-xor` combine two integers bit by bit. `[operators.bit.logic]`

**Defined.** `bit-shl` and `bit-shr` shift an integer left or right by a number of bits. `bit-shr` keeps the sign, so `-1 bit-shr 1` is `-1`. Bits shifted out on the left are lost, including into the sign bit. A shift by a negative amount or by 64 or more is a runtime error, `nu::shell::operator_overflow`. `[operators.bit.shift]`

**Defined.** Bitwise operators only work on integers. Floats, booleans and binary values are a parse error, `nu::parser::operator_unsupported_type`. `[operators.bit.types]`

## Boolean

**Defined.** `and`, `or` and `xor` combine two booleans, and `not` negates one. `[operators.bool.logic]`

**Defined.** `and` doesn't evaluate its right side when the left is `false`, and `or` doesn't when the left is `true`. `xor` always evaluates both sides. `[operators.bool.short-circuit]`

**Defined.** The operands of `and`, `or` and `xor` must be booleans. Another type is a parse error, `nu::parser::operator_unsupported_type`. `not` with a value that isn't a boolean is a runtime error, `nu::shell::cant_convert`. `[operators.bool.types]`

**Defined.** `&&` and `||` are not operators. Using them is a parse error, `nu::parser::shell_andand` or `nu::parser::shell_oror`, with a hint to use `and` or `or`. `!` is not negation: `!true` is a command name. `[operators.bool.shell-syntax]`

**Defined.** `not` applies only to the single value directly after it. To negate a comparison or other expression, put it in parentheses: `not ("a" == "b")`. Without them, `not "a" == "b"` negates `"a"`, which is a runtime error, `nu::shell::cant_convert`. `[operators.not.operand]`

**Open question:** the lang guide, the Book and `help operators` all give `not` a lower precedence than the comparison operators, which would make `not 1 == 2` mean `not (1 == 2)`. The parser instead applies `not` to `1` alone.

## Precedence

**Defined.** From highest to lowest, the operators covered here are: `**`; `*`, `/`, `//`, `mod`; `+`, `-`; `bit-shl`, `bit-shr`; the comparison operators; `bit-and`; `bit-xor`; `bit-or`; `and`; `xor`; `or`. Because comparisons come before `bit-and`, `6 bit-and 3 == 2` means `6 bit-and (3 == 2)`, which is a parse error, `nu::parser::operator_unsupported_type`. `[operators.precedence]`

**Defined.** Parentheses group an expression so it is evaluated first. They may also contain a pipeline, whose result is used as the value. `[operators.parens]`
