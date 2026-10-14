# id: operators.compare.list-order
# rule: operators.compare.unordered
# expect: parse-error
# error: nu::parser::operator_unsupported_type
[1 2] < [1 3]
