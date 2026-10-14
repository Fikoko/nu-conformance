# id: types.int.binary-bad-digit
# rule: types.int.radix-invalid
# expect: parse-error
# error: nu::parser::error
[0b2] | to nuon
