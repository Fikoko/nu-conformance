# id: types.record.bare-key-punctuation
# rule: types.record.keys
# expect: output
# ---
# {a-b: 1, "a.b": 2}
# ---
{a-b: 1, a.b: 2} | to nuon
