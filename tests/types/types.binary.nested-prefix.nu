# id: types.binary.nested-prefix
# rule: types.binary.invalid
# expect: parse-error
# error: nu::parser::invalid_binary_string
0x[0x01]
