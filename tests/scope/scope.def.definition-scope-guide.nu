# id: scope.def.definition-scope-guide
# rule: scope.def.variables
# expect: output
# ---
# 1
# ---
let x = 1
def f [] { $x }
def g [] { let x = 5; f }
g
