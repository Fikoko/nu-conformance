# id: operators.assign.divide-int
# rule: operators.assign.compound
# expect: parse-error
# error: nu::parser::operator_incompatible_types
mut x = 7
$x /= 2
