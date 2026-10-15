# id: flow.try.rest-skipped
# rule: flow.try.value
# expect: output
# ---
# caught
# ---
try { error make {msg: x}; print 'not reached' } catch { 'caught' }
