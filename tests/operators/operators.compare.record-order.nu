# id: operators.compare.record-order
# rule: operators.compare.unordered
# expect: parse-error
# error: nu::parser::operator_unsupported_type
{a: 1} < {a: 2}
