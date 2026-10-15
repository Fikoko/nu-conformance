# id: scope.closure.no-mut-do
# rule: scope.closure.no-mut
# expect: parse-error
# error: nu::parser::expected_keyword
mut x = 1
do { $x = 2 }
