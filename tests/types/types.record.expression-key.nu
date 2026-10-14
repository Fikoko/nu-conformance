# id: types.record.expression-key
# rule: types.record.keys
# expect: output
# ---
# [{dyn: 1}, {"k1": 1}]
# ---
let k = "dyn"
[{($k): 1} {$"k(1)": 1}] | to nuon
