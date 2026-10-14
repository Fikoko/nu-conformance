# id: operators.assign.int-plus-float
# rule: operators.assign.type
# expect: parse-error
# error: nu::parser::operator_incompatible_types
mut x = 1
$x += 1.5
