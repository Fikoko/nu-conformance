# id: strings.double-quoted.hex-invalid-utf8
# rule: strings.double-quoted.escapes.hex-utf8
# expect: parse-error
# error: nu::parser::parse_mismatch
"\xFF"
