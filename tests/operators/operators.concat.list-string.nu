# id: operators.concat.list-string
# rule: operators.concat
# expect: parse-error
# error: nu::parser::operator_incompatible_types
[1] ++ "a"
