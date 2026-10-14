# id: types.record.quoted-keys
# rule: types.record.keys
# expect: output
# ---
# {"a b": 1, x: 2, "": 3}
# ---
{"a b": 1, 'x': 2, "": 3} | to nuon
