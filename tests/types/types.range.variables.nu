# id: types.range.variables
# rule: types.range.literal
# expect: output
# ---
# [2, 3, 4]
# ---
let a = 2
let b = 4
$a..$b | each {||} | to nuon
