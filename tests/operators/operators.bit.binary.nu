# id: operators.bit.binary
# rule: operators.bit.types
# expect: parse-error
# error: nu::parser::operator_unsupported_type
0x[0f] bit-and 0x[ff]
