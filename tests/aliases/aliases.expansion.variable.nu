# id: aliases.expansion.variable
# rule: aliases.expansion.not-a-command
# expect: parse-error
# error: nu::parser::cant_alias_expression
let x = 1
alias q = $x
