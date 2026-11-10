# id: aliases.expansion.redirect-error
# rule: aliases.expansion.pipe
# expect: parse-error
# error: nu::parser::cant_alias_expression
alias q = echo 1 o> x.txt
q
