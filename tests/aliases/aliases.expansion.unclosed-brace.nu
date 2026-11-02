# id: aliases.expansion.unclosed-brace
# rule: aliases.expansion.errors
# expect: parse-error
# error: nu::parser::unclosed_delimiter
alias q = do { 1
