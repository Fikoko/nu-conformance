# id: operators.concat.list-int-book
# rule: operators.concat
# expect: parse-error
# error: nu::parser::operator_unsupported_type
[1 2] ++ 3
