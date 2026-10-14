# id: types.record.space-before-colon
# rule: types.record.separators
# expect: output
# ---
# [[a]; [1], [1]]
# ---
[{a : 1} {a :1}] | to nuon
