# id: strings.double-quoted.hex-not-hex
# rule: strings.double-quoted.escapes.hex
# expect: parse-error
# error: nu::parser::error
"\xZZ"
