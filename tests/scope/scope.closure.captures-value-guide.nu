# id: scope.closure.captures-value-guide
# rule: scope.closure.capture
# expect: output
# ---
# 1
# ---
let x = 1
let get_x = {|| $x }
let x = 2
do $get_x
