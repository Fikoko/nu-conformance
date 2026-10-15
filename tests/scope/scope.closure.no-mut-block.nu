# id: scope.closure.no-mut-block
# rule: scope.closure.no-mut
# expect: parse-error
# error: nu::parser::expected_keyword
mut x = 1
let c = { $x }
