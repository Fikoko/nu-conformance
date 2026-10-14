# id: operators.prec.and-before-or
# rule: operators.precedence
# expect: output
# ---
# [true, true]
# ---
[(true or false and false) (false and true or true)] | to nuon
