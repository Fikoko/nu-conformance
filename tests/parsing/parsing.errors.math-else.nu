# id: parsing.errors.math-else
# rule: parsing.errors.math
# expect: parse-error
# error: nu::parser::incomplete_math_expression
if false { 'a' } else (1 +) 2
