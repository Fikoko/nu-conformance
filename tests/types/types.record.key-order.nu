# id: types.record.key-order
# rule: types.record.order
# expect: output
# ---
# [b, a]
# ---
{b: 1, a: 2} | columns | to nuon
