# id: operators.bool.not
# rule: operators.bool.logic
# expect: output
# ---
# [false, true, true]
# ---
[(not true) (not false) (not not true)] | to nuon
