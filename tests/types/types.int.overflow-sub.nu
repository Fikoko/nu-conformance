# id: types.int.overflow-sub
# rule: types.int.overflow
# expect: runtime-error
# error: nu::shell::operator_overflow
-9223372036854775808 - 1
