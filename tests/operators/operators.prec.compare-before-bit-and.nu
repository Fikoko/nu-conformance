# id: operators.prec.compare-before-bit-and
# rule: operators.precedence
# expect: parse-error
# error: nu::parser::operator_unsupported_type
6 bit-and 3 == 2
