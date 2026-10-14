# id: operators.assign.immutable
# rule: operators.assign.mutable
# expect: parse-error
# error: nu::parser::assignment_requires_mutable_variable
let x = 1
$x = 2
