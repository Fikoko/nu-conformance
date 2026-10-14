# id: operators.compare.null-less
# rule: operators.compare.null
# expect: output
# ---
# [nothing, nothing, nothing, nothing]
# ---
[(null < 1 | describe) (1 < null | describe) (null <= null | describe) ("a" < null | describe)] | to nuon
