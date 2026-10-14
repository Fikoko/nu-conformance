# id: operators.not.before-comparison
# rule: operators.not.operand
# expect: parse-error
# error: nu::parser::operator_incompatible_types
not 1 < 2
