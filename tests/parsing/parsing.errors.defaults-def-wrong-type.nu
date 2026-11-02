# id: parsing.errors.defaults-def-wrong-type
# rule: parsing.errors.defaults
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [x: int = "a"] { $x }
