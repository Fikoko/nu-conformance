# id: operators.bit.shift-too-far
# rule: operators.bit.shift
# expect: runtime-error
# error: nu::shell::operator_overflow
1 bit-shl 64
