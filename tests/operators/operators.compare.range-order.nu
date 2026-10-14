# id: operators.compare.range-order
# rule: operators.compare.unordered
# expect: parse-error
# error: nu::parser::operator_unsupported_type
1..3 < 1..4
