# id: parsing.errors.defaults-closure-int-for-string
# rule: parsing.errors.defaults
# expect: output
# ---
# 1
# ---
do {|x: string = 1| $x }
