# id: operators.regex.match-book
# rule: operators.regex.match
# expect: output
# ---
# [true, false]
# ---
[("foobarbaz" =~ "bar") ("foobarbaz" !~ "bar")] | to nuon
