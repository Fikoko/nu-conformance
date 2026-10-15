# id: scope.def.nested-guide
# rule: scope.def.visibility
# expect: output
# ---
# helper
# ---
def outer [] { def helper [] { 'helper' }; helper }; outer
