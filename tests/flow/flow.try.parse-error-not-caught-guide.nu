# id: flow.try.parse-error-not-caught-guide
# rule: flow.try.parse-errors
# expect: parse-error
# error: nu::parser::incomplete_math_expression
try { 1 + } catch { "never reached" }
