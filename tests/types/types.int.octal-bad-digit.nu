# id: types.int.octal-bad-digit
# rule: types.int.radix-invalid
# expect: parse-error
# error: nu::parser::error
[0o8] | to nuon
