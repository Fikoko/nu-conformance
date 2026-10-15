# id: flow.try.finally-uncaught-book
# rule: flow.try.finally
# expect: output
# ---
# cleaning up
# Division by zero.
# ---
try { try { 1 / 0 } finally { print 'cleaning up' } } catch {|e| $e.msg }
