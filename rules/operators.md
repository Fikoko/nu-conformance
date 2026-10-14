# Operators

Draft rules for the [Operators](https://www.nushell.sh/lang-guide/chapters/operators.html) chapter of the lang guide, and the Book's [Operators](https://www.nushell.sh/book/operators.html) page it points to. It covers arithmetic, comparison, bitwise, boolean, regex, membership and string operators, assignment, the spread operator, and precedence.

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

**Defined.** From highest to lowest, the operators are: `**`; `*`, `/`, `//`, `mod`; `+`, `-`; `bit-shl`, `bit-shr`; the comparison, regex, membership and `starts-with`/`ends-with` operators and `++`; `bit-and`; `bit-xor`; `bit-or`; `and`; `xor`; `or`; and the assignment operators. Because comparisons come before `bit-and`, `6 bit-and 3 == 2` means `6 bit-and (3 == 2)`, which is a parse error, `nu::parser::operator_unsupported_type`. `[operators.precedence]`

**Defined.** Parentheses group an expression so it is evaluated first. They may also contain a pipeline, whose result is used as the value. `[operators.parens]`

## Regex match

**Defined.** `=~` (also written `like`) is `true` if the string on the left contains a match for the regular expression on the right. `!~` (also written `not-like`) is the opposite. The match can be anywhere in the string, and an empty pattern always matches. `[operators.regex.match]`

**Defined.** Regex matching is case-sensitive unless the pattern turns that off, for example with `(?i)`. `[operators.regex.case]`

**Implementation-defined.** The regular expression syntax is that of the implementation's regex engine. Nushell 0.116.1 uses the Rust `regex` crate. An invalid pattern is a runtime error, `nu::shell::invalid_value`. `[operators.regex.invalid]`

**Defined.** Both sides of a regex operator must be strings. Another type on either side is a parse error, `nu::parser::operator_unsupported_type`. `[operators.regex.types]`

## Starts-with and ends-with

**Defined.** `starts-with` and `ends-with` test whether a string begins or ends with another string, and `not-starts-with` and `not-ends-with` are the opposites. The test is case-sensitive, and every string starts with the empty string. Both sides must be strings, otherwise it is a parse error, `nu::parser::operator_unsupported_type`. `[operators.affix.match]`

## Membership

**Defined.** `in` is `true` if the value on the left is an item of the list on the right. `has` is the same test with the sides swapped, and `not-in` and `not-has` are the opposites. Items are compared as with `==`, so lists and `null` can be found too. `[operators.member.list]`

**Defined.** With strings on both sides, `in` is `true` if the left string appears inside the right one. The test is case-sensitive, and the empty string is in every string. `[operators.member.string]`

**Defined.** With a record on the right, `in` is `true` if the string on the left is one of its keys. `[operators.member.record]`

**Defined.** With a range on the right, `in` is `true` if the value is one of the values the range produces, so `1.5 in 1..5` is `false`. `[operators.member.range]`

**Defined.** If the left value's type can't be an item of the right side, it is a parse error, `nu::parser::operator_incompatible_types`. This includes an integer in a list of floats, and a non-string with a string or record on the right. A right side that holds no items, such as `null` or an integer, is a parse error, `nu::parser::operator_unsupported_type`. `[operators.member.types]`

**Open question:** `1 == 1.0` is `true`, but `1 in [1.0]` is a parse error.

## Concatenation

**Defined.** `++` joins two strings, two lists or two binary values. `+` also joins two strings. Both sides must be the same kind; anything else is a parse error, `nu::parser::operator_unsupported_type` or `nu::parser::operator_incompatible_types`. Records can't be joined with `++`. `++` has the same precedence as the comparison operators. `[operators.concat]`

## Assignment

**Defined.** `$name = value` gives a mutable variable a new value. There must be whitespace around `=`; `$x=2` is a parse error, `nu::parser::parse_mismatch_with_did_you_mean`. `[operators.assign.basic]`

**Defined.** `+=`, `-=`, `*=`, `/=` and `++=` apply the operator to the variable's value and the right side, and store the result. There are no `//=` or `**=`; writing them is a parse error, `nu::parser::parse_mismatch`. `[operators.assign.compound]`

**Defined.** Only variables declared with `mut` can be assigned. Assigning a `let` variable is a parse error, `nu::parser::assignment_requires_mutable_variable`, and assigning an undefined variable is a parse error, `nu::parser::variable_not_found`. `[operators.assign.mutable]`

**Defined.** An assignment can't change a variable's type. Assigning a value of another type, or a compound assignment whose result would have another type (such as `/=` on an integer), is a parse error, `nu::parser::operator_incompatible_types`. `[operators.assign.type]`

**Defined.** The right side of an assignment is a whole pipeline, so `$x = 1 | $in + 5` stores `6`. This also applies to compound assignment: `$x += 1 | describe` adds the string `"int"`. An assignment produces no value (`null`). `[operators.assign.value]`

**Defined.** The left side of an assignment may be a cell path into the variable. Assigning a record key that doesn't exist adds it. Assigning a list index past the end is a runtime error, `nu::shell::access_beyond_end`. `[operators.assign.cell-path]`

## Spread

**Defined.** In a list literal, `...` directly before a variable, a parenthesized expression or a list literal inserts that list's items. `...` before a bare word, or followed by a space, is an ordinary string. Spreading a value that isn't a list is a runtime error, `nu::shell::cannot_spread_as_list`. `[operators.spread.list]`

**Defined.** In a record literal, `...` directly before a variable, a parenthesized expression or a record literal inserts that record's pairs. Spreading a value that isn't a record is a runtime error, `nu::shell::cannot_spread_as_record`. `[operators.spread.record]`

**Defined.** In a command call, `...` directly before a list passes its items as separate arguments to the command's rest parameter. Spread and ordinary arguments can be mixed, and flags can come after a spread. A spread before an optional positional parameter means that parameter is not given. With a space after `...`, it is an ordinary argument. Spreading into a command without a rest parameter is a parse error, `nu::parser::unexpected_spread_arg`. `[operators.spread.args]`

**Defined.** In a command call, `...` directly before a record passes its pairs as flags, with each key the flag's name. For a switch, `true` sets it and `false` or `null` leaves it off. A key that isn't a flag of the command is a runtime error, `nu::shell::error`, and a value of the wrong type is a runtime error, `nu::shell::cant_convert`. `[operators.spread.flags]`
