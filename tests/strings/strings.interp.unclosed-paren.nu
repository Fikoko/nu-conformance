# id: strings.interp.unclosed-paren
# rule: strings.interp.unclosed
# expect: parse-error
# error: nu::parser::unclosed_delimiter
$"a (1 + 1"
