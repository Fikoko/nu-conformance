# id: flow.for.body-local
# rule: flow.for.variable
# expect: parse-error
# error: nu::parser::variable_not_found
for x in [1 2] { let y = $x }
$y
