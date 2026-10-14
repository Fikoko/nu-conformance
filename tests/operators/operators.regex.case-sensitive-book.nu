# id: operators.regex.case-sensitive-book
# rule: operators.regex.case
# expect: output
# ---
# [false, true]
# ---
[("FOO" =~ "foo") ("FOO" =~ "(?i)foo")] | to nuon
