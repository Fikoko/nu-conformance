# id: strings.double-quoted.unicode-surrogate-high
# rule: strings.double-quoted.escapes.unicode
# expect: parse-error
# error: nu::parser::error
"\u{DFFF}"
