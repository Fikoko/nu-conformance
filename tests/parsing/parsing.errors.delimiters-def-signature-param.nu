# id: parsing.errors.delimiters-def-signature-param
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
def f [x { 1 }
