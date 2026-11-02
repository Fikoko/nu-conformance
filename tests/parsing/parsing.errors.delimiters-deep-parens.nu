# id: parsing.errors.delimiters-deep-parens
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
print (1 + (2 * (3 - (4
