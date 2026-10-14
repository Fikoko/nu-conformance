# id: operators.regex.list-left
# rule: operators.regex.types
# expect: parse-error
# error: nu::parser::operator_unsupported_type
[a b] =~ "a"
