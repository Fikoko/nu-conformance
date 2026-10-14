# id: types.binary.bad-octal-digit
# rule: types.binary.invalid
# expect: parse-error
# error: nu::parser::invalid_binary_string
0o[8]
