# id: parsing.errors.delimiters-if-block
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
do { if true { 1 }
