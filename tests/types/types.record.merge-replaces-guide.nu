# id: types.record.merge-replaces-guide
# rule: types.record.duplicate-keys
# expect: output
# ---
# {a: 5, b: 2}
# ---
{a: 1, b: 2} | merge {a: 5} | to nuon
