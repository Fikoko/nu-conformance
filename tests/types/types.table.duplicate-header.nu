# id: types.table.duplicate-header
# rule: types.table.duplicate-header
# expect: parse-error
# error: nu::parser::column_defined_twice
# status: pending
[[a a]; [1 2]]
