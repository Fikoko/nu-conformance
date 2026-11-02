# id: parsing.errors.first-in-source-order-reversed
# rule: parsing.errors.first
# expect: parse-error
# error: nu::parser::incomplete_math_expression
1 +; let x =
