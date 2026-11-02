# id: parsing.errors.binary-invalid-binary
# rule: parsing.lenient.binary-pipe
# expect: parse-error
# error: nu::parser::invalid_binary_string
0b[12]
