# id: parsing.errors.delimiters-nested-paren
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
do { do { (1 } }
