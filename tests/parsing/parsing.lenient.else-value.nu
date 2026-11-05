# id: parsing.lenient.else-value
# rule: parsing.lenient.else-value
# expect: output
# ---
# 1
# ---
let x = 1
if false { 'a' } else $x
