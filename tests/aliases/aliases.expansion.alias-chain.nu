# id: aliases.expansion.alias-chain
# rule: aliases.expansion.alias
# expect: output
# ---
# hi
# ---
alias a = echo hi
alias b = a
alias c = b
c
