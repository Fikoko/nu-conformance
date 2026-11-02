# id: parsing.errors.defaults-closure-wrong-type
# rule: parsing.errors.defaults
# expect: parse-error
# error: nu::parser::parse_mismatch
do {|x: int = "a"| $x }
