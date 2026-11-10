# id: types.record.duplicate-key-guide
# rule: types.record.duplicate-keys
# expect: parse-error
# error: nu::parser::column_defined_twice
{a: 1, a: 2}
