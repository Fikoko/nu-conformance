# id: types.record.number-key-is-string
# rule: types.record.keys
# expect: output
# ---
# list<string>
# ---
{1: one} | columns | describe
