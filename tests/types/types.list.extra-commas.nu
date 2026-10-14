# id: types.list.extra-commas
# rule: types.list.separators
# expect: output
# ---
# [[1, 2], [1], [1]]
# ---
[[1,,2] [1,] [,1]] | to nuon
