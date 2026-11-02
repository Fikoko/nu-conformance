# id: parsing.errors.delimiters-single-quote-in-block
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
do { 'abc }
