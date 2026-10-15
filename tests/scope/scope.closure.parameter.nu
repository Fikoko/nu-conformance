# id: scope.closure.parameter
# rule: scope.closure.capture
# expect: output
# ---
# 42
# ---
let f = {|a| $a * 2 }
do $f 21
