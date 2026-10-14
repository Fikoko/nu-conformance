# id: operators.assign.type-change
# rule: operators.assign.type
# expect: parse-error
# error: nu::parser::operator_incompatible_types
mut x = 1
$x = "a"
