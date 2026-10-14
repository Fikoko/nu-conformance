# id: operators.member.in-null
# rule: operators.member.types
# expect: parse-error
# error: nu::parser::operator_unsupported_type
"a" in null
