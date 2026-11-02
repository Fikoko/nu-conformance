# id: aliases.expansion.alias-of-alias
# rule: aliases.expansion.alias
# expect: output
# ---
# hi
# ---
alias a = echo hi
alias b = a
b
