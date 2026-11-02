# id: parsing.errors.delimiters-external-word-paren
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
^$nu.current-exe foo(
