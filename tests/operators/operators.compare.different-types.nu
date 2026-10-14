# id: operators.compare.different-types
# rule: operators.compare.equality
# expect: output
# ---
# [false, false, true]
# ---
[(1 == "1") (null == false) (null != 1)] | to nuon
