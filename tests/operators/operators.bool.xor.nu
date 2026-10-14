# id: operators.bool.xor
# rule: operators.bool.logic
# expect: output
# ---
# [false, true]
# ---
[(true xor true) (true xor false)] | to nuon
