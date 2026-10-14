# id: operators.prec.xor-between-and-or
# rule: operators.precedence
# expect: output
# ---
# [true, true]
# ---
[(true xor true or true) (true or true xor true)] | to nuon
