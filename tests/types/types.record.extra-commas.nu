# id: types.record.extra-commas
# rule: types.record.separators
# expect: output
# ---
# [{a: 1, b: 2}, {a: 1}]
# ---
[{a: 1,, b: 2} {a: 1,}] | to nuon
