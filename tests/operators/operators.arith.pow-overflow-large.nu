# id: operators.arith.pow-overflow-large
# rule: operators.arith.overflow
# expect: runtime-error
# error: nu::shell::operator_overflow
9223372036854775807 ** 2
