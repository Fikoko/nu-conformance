# id: aliases.expansion.incomplete-math-in-closure
# rule: aliases.expansion.errors
# expect: parse-error
# error: nu::parser::incomplete_math_expression
alias q = do {|x| $x + }
