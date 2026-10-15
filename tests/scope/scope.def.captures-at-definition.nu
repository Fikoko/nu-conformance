# id: scope.def.captures-at-definition
# rule: scope.def.variables
# expect: output
# ---
# 1
# ---
let x = 1
def f [] { $x }
let x = 2
f
