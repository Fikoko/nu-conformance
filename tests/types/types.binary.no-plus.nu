# id: types.binary.no-plus
# rule: types.binary.arithmetic
# expect: parse-error
# error: nu::parser::operator_unsupported_type
0x[01] + 0x[02]
