# id: operators.bit.bool
# rule: operators.bit.types
# expect: parse-error
# error: nu::parser::operator_unsupported_type
true bit-and false
