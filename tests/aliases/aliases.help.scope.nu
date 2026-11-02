# id: aliases.help.scope
# rule: aliases.help
# expect: output
# ---
# echo hi
# ---
alias q = echo hi
scope aliases | where name == q | get expansion.0
