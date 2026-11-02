# id: aliases.expansion.unclosed-paren
# rule: aliases.expansion.errors
# expect: parse-error
# error: nu::parser::unclosed_delimiter
alias q = echo (1
