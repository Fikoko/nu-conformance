# id: aliases.expansion.unclosed-single-quote
# rule: aliases.expansion.errors
# expect: parse-error
# error: nu::parser::unclosed_delimiter
alias q = echo 'abc
