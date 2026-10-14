# id: types.int.overflow-mul
# rule: types.int.overflow
# expect: runtime-error
# error: nu::shell::operator_overflow
9223372036854775807 * 2
