# id: strings.double-quoted.unicode-surrogate
# rule: strings.double-quoted.escapes.unicode
# expect: parse-error
# error: nu::parser::error
"\u{D800}"
