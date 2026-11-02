# id: parsing.errors.delimiters-stray-brace
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
echo }
