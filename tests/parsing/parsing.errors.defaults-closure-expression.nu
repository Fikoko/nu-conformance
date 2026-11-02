# id: parsing.errors.defaults-closure-expression
# rule: parsing.errors.defaults
# expect: parse-error
# error: nu::parser::parse_mismatch
do {|x = 1 + 1| $x }
