# id: scope.block.if-assigns-mut-guide
# rule: scope.block.mut
# expect: output
# ---
# 2
# ---
mut count = 1; if true { $count = 2 }; $count
