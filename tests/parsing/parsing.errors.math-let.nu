# id: parsing.errors.math-let
# rule: parsing.errors.math
# expect: parse-error
# error: nu::parser::incomplete_math_expression
let x = 1 +; let y = 2 +
