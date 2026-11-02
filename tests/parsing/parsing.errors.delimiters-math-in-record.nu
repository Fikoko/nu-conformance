# id: parsing.errors.delimiters-math-in-record
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
{a: (1 + }
