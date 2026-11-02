# id: aliases.expansion.string
# rule: aliases.expansion.not-a-command
# expect: parse-error
# error: nu::parser::cant_alias_expression
alias q = "str"
