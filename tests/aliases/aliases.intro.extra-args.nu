# id: aliases.intro.extra-args
# rule: aliases.intro
# expect: output
# ---
# [1, 2]
# ---
alias e = echo 1
e 2 | to nuon
