# id: strings.double-quoted.unicode-above-max
# rule: strings.double-quoted.escapes.unicode
# expect: parse-error
# error: nu::parser::error
"\u{110000}"
