# id: types.list.concat-non-list
# rule: types.list.operators
# expect: parse-error
# error: nu::parser::operator_unsupported_type
[1 2] ++ 3
