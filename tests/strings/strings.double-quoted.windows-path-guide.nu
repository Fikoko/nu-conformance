# id: strings.double-quoted.windows-path-guide
# rule: strings.double-quoted.escapes.unknown
# expect: parse-error
# error: nu::parser::error
"C:\Program Files\somedir"
