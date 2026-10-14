# id: types.int.overflow-div
# rule: types.int.overflow
# expect: runtime-error
# error: nu::shell::operator_overflow
-9223372036854775808 // -1
