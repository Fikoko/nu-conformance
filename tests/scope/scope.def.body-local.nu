# id: scope.def.body-local
# rule: scope.def.variables
# expect: parse-error
# error: nu::parser::variable_not_found
def f [a] { let b = 1; $a }
f 1
$b
