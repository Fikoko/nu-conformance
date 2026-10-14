# id: types.table.literal-guide
# rule: types.table.literal
# expect: output
# ---
# true
# ---
[[column1, column2]; [Value1, Value2] [Value3, Value4]] == [{column1: Value1, column2: Value2}, {column1: Value3, column2: Value4}]
