# id: types.binary.octal-too-many-digits-book
# rule: types.binary.octal-bytes
# expect: parse-error
# error: nu::parser::invalid_binary_string
0o[1234567]
