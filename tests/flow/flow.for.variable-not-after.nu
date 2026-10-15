# id: flow.for.variable-not-after
# rule: flow.for.variable
# expect: parse-error
# error: nu::parser::variable_not_found
for x in [1] { }
$x
