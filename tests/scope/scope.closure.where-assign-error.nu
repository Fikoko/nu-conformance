# id: scope.closure.where-assign-error
# rule: scope.closure.where
# expect: parse-error
# error: nu::parser::expected_keyword
# status: pending
mut x = 0
[1 2 3] | where {|v| $x += 1; true } | ignore
$x
