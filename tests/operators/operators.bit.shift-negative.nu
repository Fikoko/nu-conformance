# id: operators.bit.shift-negative
# rule: operators.bit.shift
# expect: runtime-error
# error: nu::shell::operator_overflow
1 bit-shl -1
