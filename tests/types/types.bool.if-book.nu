# id: types.bool.if-book
# rule: types.bool.comparison
# expect: output
# ---
# It's negative
# ---
let num = -2
if $num < 0 { print "It's negative" }
