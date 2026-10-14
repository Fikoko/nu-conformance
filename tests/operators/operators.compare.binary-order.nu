# id: operators.compare.binary-order
# rule: operators.compare.unordered
# expect: parse-error
# error: nu::parser::operator_unsupported_type
0x[01] < 0x[02]
