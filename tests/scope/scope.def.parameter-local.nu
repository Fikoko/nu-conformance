# id: scope.def.parameter-local
# rule: scope.def.variables
# expect: parse-error
# error: nu::parser::variable_not_found
def f [a] { $a }
f 1
$a
