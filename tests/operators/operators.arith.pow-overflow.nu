# id: operators.arith.pow-overflow
# rule: operators.arith.overflow
# expect: runtime-error
# error: nu::shell::operator_overflow
2 ** 63
