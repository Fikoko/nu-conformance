# id: aliases.names.backup-book
# rule: aliases.names.shadow
# expect: output
# ---
# [0, shadow]
# ---
alias core-ls = ls
alias ls = echo shadow
[(core-ls | length) (ls)] | to nuon
