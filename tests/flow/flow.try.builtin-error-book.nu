# id: flow.try.builtin-error-book
# rule: flow.try.value
# expect: output
# ---
# Resuming
# ---
try { 1 / 0 }; print 'Resuming'
