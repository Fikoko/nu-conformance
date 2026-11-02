# id: aliases.expansion.if
# rule: aliases.expansion.keywords
# expect: output
# ---
# yes
# ---
alias i = if
i true { 'yes' } else { 'no' }
