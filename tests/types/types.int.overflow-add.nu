# id: types.int.overflow-add
# rule: types.int.overflow
# expect: runtime-error
# error: nu::shell::operator_overflow
9223372036854775807 + 1
