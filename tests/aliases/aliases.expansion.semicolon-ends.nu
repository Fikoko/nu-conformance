# id: aliases.expansion.semicolon-ends
# rule: aliases.expansion.pipe
# expect: output
# ---
# [1, 3]
# ---
alias q = echo 1; 2
q 3 | to nuon
