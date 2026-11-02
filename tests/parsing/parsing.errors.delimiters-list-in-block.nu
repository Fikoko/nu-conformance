# id: parsing.errors.delimiters-list-in-block
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
do { [1 2 }
