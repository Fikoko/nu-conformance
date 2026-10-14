# id: operators.bool.and
# rule: operators.bool.logic
# expect: output
# ---
# [false, true, false]
# ---
[(true and false) (true and true) (false and false)] | to nuon
