# id: parsing.errors.math-subexpression
# rule: parsing.errors.math
# expect: parse-error
# error: nu::parser::incomplete_math_expression
let x = (1 + )
