# id: operators.member.string-in-int-list
# rule: operators.member.types
# expect: parse-error
# error: nu::parser::operator_incompatible_types
"1" in [1]
