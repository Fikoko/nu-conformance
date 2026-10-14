# id: types.record.spread
# rule: types.record.spread
# expect: output
# ---
# {a: 1, b: 2}
# ---
let r = {a: 1}
{...$r, b: 2} | to nuon
