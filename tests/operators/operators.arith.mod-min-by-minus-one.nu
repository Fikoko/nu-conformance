# id: operators.arith.mod-min-by-minus-one
# rule: operators.arith.overflow
# expect: runtime-error
# error: nu::shell::operator_overflow
(-9223372036854775808) mod -1
