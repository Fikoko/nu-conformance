# id: strings.double-quoted.unicode-seven-digits
# rule: strings.double-quoted.escapes.unicode
# expect: parse-error
# error: nu::parser::error
"\u{1234567}"
