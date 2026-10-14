# id: types.record.access
# rule: types.record.access
# expect: output
# ---
# [1, 1]
# ---
let r = {a: {b: 1}}
[$r.a.b ({a: 1}.a)] | to nuon
