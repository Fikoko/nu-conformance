# id: types.record.equality-ignores-order
# rule: types.record.order
# expect: output
# ---
# true
# ---
{a: 1, b: 2} == {b: 2, a: 1}
