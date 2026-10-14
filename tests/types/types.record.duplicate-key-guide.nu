# id: types.record.duplicate-key-guide
# rule: types.record.duplicate-keys
# expect: runtime-error
# error: nu::shell::column_defined_twice
{a: 1, a: 2}
