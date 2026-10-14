# id: types.table.missing-columns
# rule: types.table.row-length
# expect: parse-error
# error: nu::parser::missing_columns
[[a b]; [1]]
