# id: types.table.duplicate-header
# rule: types.table.duplicate-header
# expect: runtime-error
# error: nu::shell::column_defined_twice
[[a a]; [1 2]]
