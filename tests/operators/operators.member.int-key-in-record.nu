# id: operators.member.int-key-in-record
# rule: operators.member.types
# expect: parse-error
# error: nu::parser::operator_incompatible_types
1 in {a: 1}
