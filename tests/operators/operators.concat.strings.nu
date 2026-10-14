# id: operators.concat.strings
# rule: operators.concat
# expect: output
# ---
# [ab, ab]
# ---
[("a" ++ "b") ("a" + "b")] | to nuon
