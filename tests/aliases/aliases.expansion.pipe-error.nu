# id: aliases.expansion.pipe-error
# rule: aliases.expansion.pipe
# expect: parse-error
# error: nu::parser::cant_alias_expression
# status: pending
alias q = echo 1 | str length
q | to nuon
