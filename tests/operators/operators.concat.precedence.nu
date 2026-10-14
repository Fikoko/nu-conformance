# id: operators.concat.precedence
# rule: operators.concat
# expect: output
# ---
# [true, true]
# ---
[("b" in "abc" and true) ("abc" =~ "b" == true)] | to nuon
