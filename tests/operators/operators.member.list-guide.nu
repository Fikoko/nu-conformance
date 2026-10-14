# id: operators.member.list-guide
# rule: operators.member.list
# expect: output
# ---
# [false, false, true]
# ---
[(12 in [1 2 3]) ([1 2 3] has 12) (2 in [1 2 3])] | to nuon
