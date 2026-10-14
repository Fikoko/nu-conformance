# id: operators.assign.undefined
# rule: operators.assign.mutable
# expect: parse-error
# error: nu::parser::variable_not_found
$nope = 1
