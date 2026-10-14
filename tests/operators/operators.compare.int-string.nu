# id: operators.compare.int-string
# rule: operators.compare.incompatible
# expect: parse-error
# error: nu::parser::operator_incompatible_types
1 < "2"
