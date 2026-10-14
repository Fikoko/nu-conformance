# id: types.table.extra-columns
# rule: types.table.row-length
# expect: parse-error
# error: nu::parser::extra_columns
[[a b]; [1 2 3]]
