# id: scope.closure.no-mut-each
# rule: scope.closure.no-mut
# expect: parse-error
# error: nu::parser::expected_keyword
mut x = 1
[1 2] | each { $x }
