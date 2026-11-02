# id: parsing.errors.delimiters-interpolation
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
$"(1"
