# id: parsing.errors.defaults-closure-in-let
# rule: parsing.errors.defaults
# expect: parse-error
# error: nu::parser::parse_mismatch
let f = {|x: int = "a"| $x }
