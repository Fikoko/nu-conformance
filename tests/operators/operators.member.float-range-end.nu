# id: operators.member.float-range-end
# rule: operators.member.range
# expect: output
# ---
# [true, false]
# ---
# status: pending
[(2.0 in 1.0..2.0) (2.0 in 1.0..<2.0)] | to nuon
