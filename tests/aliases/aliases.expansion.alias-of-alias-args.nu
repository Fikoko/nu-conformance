# id: aliases.expansion.alias-of-alias-args
# rule: aliases.expansion.alias
# expect: output
# ---
# [1, 2]
# ---
alias a = echo
alias b = a 1
b 2 | to nuon
