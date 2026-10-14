# id: types.int.hex-bad-digit
# rule: types.int.radix-invalid
# expect: parse-error
# error: nu::parser::error
[0xg] | to nuon
