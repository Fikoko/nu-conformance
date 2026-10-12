# id: strings.double-quoted.unclosed-escaped-quote
# rule: strings.double-quoted.unclosed
# expect: parse-error
# error: nu::parser::unclosed_delimiter
"abc\"
