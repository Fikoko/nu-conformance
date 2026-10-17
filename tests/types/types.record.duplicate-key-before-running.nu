# id: types.record.duplicate-key-before-running
# rule: types.record.duplicate-keys
# expect: parse-error
# error: nu::parser::column_defined_twice
# status: pending
print before
try { {a: 1, a: 2} } catch { null }
