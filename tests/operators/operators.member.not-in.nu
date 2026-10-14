# id: operators.member.not-in
# rule: operators.member.list
# expect: output
# ---
# [false, true]
# ---
[("a" not-in "abc") ("z" not-in "abc")] | to nuon
