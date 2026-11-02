# id: aliases.expansion.unbalanced-in-block
# rule: aliases.expansion.errors
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
alias q = do { [1 2 }
