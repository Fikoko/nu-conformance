# id: operators.member.int-in-float-list
# rule: operators.member.types
# expect: parse-error
# error: nu::parser::operator_incompatible_types
1 in [1.0]
