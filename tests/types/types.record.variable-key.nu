# id: types.record.variable-key
# rule: types.record.keys
# expect: output
# ---
# {dyn: 1}
# ---
let k = "dyn"
{$k: 1} | to nuon
