# id: flow.try.finally-gets-catch-value
# rule: flow.try.finally
# expect: output
# ---
# got: caught
# caught
# ---
try { 1 / 0 } catch { 'caught' } finally {|v| print $"got: ($v)" }
