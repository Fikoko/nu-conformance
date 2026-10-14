# id: operators.member.list-nested
# rule: operators.member.list
# expect: output
# ---
# [true, true, true]
# ---
[([1] in [[1] [2]]) (null in [null]) ("abc" in ["abc" "d"])] | to nuon
