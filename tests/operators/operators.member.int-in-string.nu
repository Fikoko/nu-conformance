# id: operators.member.int-in-string
# rule: operators.member.types
# expect: parse-error
# error: nu::parser::operator_incompatible_types
1 in "123"
