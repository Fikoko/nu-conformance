# id: operators.bool.or
# rule: operators.bool.logic
# expect: output
# ---
# [true, false]
# ---
[(true or false) (false or false)] | to nuon
