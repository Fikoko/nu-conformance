# id: flow.try.finally-success-guide
# rule: flow.try.finally
# expect: output
# ---
# finally got: ok
# ok
# ---
try { "ok" } catch { "failed" } finally {|v| print $"finally got: ($v)" }
