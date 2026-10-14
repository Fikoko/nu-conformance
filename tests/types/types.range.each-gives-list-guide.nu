# id: types.range.each-gives-list-guide
# rule: types.range.lazy
# expect: output
# ---
# list<int> (stream)
# ---
1..5 | each {||} | describe
