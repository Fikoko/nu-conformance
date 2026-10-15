# id: scope.closure.where-reads-mut
# rule: scope.closure.where
# expect: output
# ---
# [[2], [2], [2]]
# ---
mut x = 1
[([1 2] | where { $in > $x }) ([1 2] | where $it > $x) ([1 2] | where {|v| $v > $x })] | to nuon
