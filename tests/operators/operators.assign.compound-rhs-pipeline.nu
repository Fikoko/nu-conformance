# id: operators.assign.compound-rhs-pipeline
# rule: operators.assign.value
# expect: runtime-error
# error: nu::shell::operator_incompatible_types
mut x = 1
$x += 1 | describe
