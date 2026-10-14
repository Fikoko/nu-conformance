# id: types.binary.bad-hex-digit
# rule: types.binary.invalid
# expect: parse-error
# error: nu::parser::invalid_binary_string
0x[g]
