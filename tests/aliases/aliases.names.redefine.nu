# id: aliases.names.redefine
# rule: aliases.names.redefine
# expect: output
# ---
# bye
# ---
alias q = echo hi
alias q = echo bye
q
