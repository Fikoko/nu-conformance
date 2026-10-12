# id: strings.double-quoted.hex-one-digit
# rule: strings.double-quoted.escapes.hex
# expect: parse-error
# error: nu::parser::error
"\x4"
