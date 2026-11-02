# id: aliases.position.inner-block
# rule: aliases.position
# expect: output
# ---
# [b, a]
# ---
alias q = echo a
let inner = do { alias q = echo b; q }
[$inner (q)] | to nuon
