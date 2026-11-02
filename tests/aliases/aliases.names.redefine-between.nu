# id: aliases.names.redefine-between
# rule: aliases.names.redefine
# expect: output
# ---
# [hi, bye]
# ---
alias q = echo hi
let a = q
alias q = echo bye
[$a (q)] | to nuon
