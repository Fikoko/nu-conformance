# id: aliases.expansion.overlay-use
# rule: aliases.expansion.keywords
# expect: output
# ---
# 1
# ---
module m { export def f [] { 1 } }
alias ou = overlay use
ou m
f
