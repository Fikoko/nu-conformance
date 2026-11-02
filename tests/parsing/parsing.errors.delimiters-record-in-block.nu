# id: parsing.errors.delimiters-record-in-block
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
do { {a: 1 }
