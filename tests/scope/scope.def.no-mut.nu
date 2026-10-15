# id: scope.def.no-mut
# rule: scope.def.variables
# expect: parse-error
# error: nu::parser::expected_keyword
mut x = 1
def f [] { $x }
