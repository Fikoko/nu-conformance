# id: operators.regex.like-aliases
# rule: operators.regex.match
# expect: output
# ---
# [true, false]
# ---
[("foobarbaz" like "bar") ("foobarbaz" not-like "bar")] | to nuon
