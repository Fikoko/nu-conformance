# id: aliases.expansion.pipe-is-argument
# rule: aliases.expansion.pipe
# expect: output
# ---
# [1, "|", str, length]
# ---
alias q = echo 1 | str length
q | to nuon
