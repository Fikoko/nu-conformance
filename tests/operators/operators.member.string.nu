# id: operators.member.string
# rule: operators.member.string
# expect: output
# ---
# [true, true, false, true]
# ---
[("b" in "abc") ("abc" has "b") ("B" in "abc") ("" in "abc")] | to nuon
