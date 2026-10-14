# id: operators.compare.strings
# rule: operators.compare.ordering
# expect: output
# ---
# [true, true, true, true]
# ---
[("a" < "b") ("B" < "a") ("a" < "aa") ("10" < "9")] | to nuon
