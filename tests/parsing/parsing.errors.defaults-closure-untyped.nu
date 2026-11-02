# id: parsing.errors.defaults-closure-untyped
# rule: parsing.errors.defaults
# expect: output
# ---
# string
# ---
do {|x = "a"| $x } | describe
