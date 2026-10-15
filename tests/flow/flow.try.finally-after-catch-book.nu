# id: flow.try.finally-after-catch-book
# rule: flow.try.finally
# expect: output
# ---
# cleaning up
# caught
# ---
try { 1 / 0 } catch { 'caught' } finally { print 'cleaning up' }
