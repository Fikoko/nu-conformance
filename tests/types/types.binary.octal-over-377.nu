# id: types.binary.octal-over-377
# rule: types.binary.octal-bytes
# expect: parse-error
# error: nu::parser::invalid_binary_string
0o[400]
