# id: parsing.errors.delimiters-raw-string
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
r#'abc'##
