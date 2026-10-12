# id: strings.double-quoted.unknown-escape-uppercase
# rule: strings.double-quoted.escapes.unknown
# expect: parse-error
# error: nu::parser::error
"\U{41}"
