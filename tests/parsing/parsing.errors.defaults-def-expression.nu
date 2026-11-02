# id: parsing.errors.defaults-def-expression
# rule: parsing.errors.defaults
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [x = 1 + 1] { $x }
