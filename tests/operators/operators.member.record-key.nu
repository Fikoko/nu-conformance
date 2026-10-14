# id: operators.member.record-key
# rule: operators.member.record
# expect: output
# ---
# [true, true, false, true]
# ---
[("a" in {a: 1}) ({a: 1} has "a") ("b" in {a: 1}) ({a: 1} not-has "b")] | to nuon
