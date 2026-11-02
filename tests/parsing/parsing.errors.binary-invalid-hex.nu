# id: parsing.errors.binary-invalid-hex
# rule: parsing.lenient.binary-pipe
# expect: parse-error
# error: nu::parser::invalid_binary_string
0x[1g]
