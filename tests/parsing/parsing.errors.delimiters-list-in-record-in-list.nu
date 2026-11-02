# id: parsing.errors.delimiters-list-in-record-in-list
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
[{a: [1 2}]
