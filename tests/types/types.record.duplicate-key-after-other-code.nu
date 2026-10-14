# id: types.record.duplicate-key-after-other-code
# rule: types.record.duplicate-keys
# expect: output
# ---
# before
# ---
print before
try { {a: 1, a: 2} } catch { null }
