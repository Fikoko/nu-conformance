# id: operators.arith.float-plus-duration
# rule: operators.arith.types
# expect: parse-error
# error: nu::parser::operator_incompatible_types
1.5 + 1sec
