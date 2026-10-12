# id: strings.double-quoted.unicode-empty
# rule: strings.double-quoted.escapes.unicode
# expect: parse-error
# error: nu::parser::error
"\u{}"
