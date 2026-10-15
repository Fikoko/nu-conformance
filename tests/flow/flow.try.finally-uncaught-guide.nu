# id: flow.try.finally-uncaught-guide
# rule: flow.try.finally
# expect: output
# ---
# cleaning up after: boom
# boom
# ---
try {
  try { error make {msg: boom} } finally {|v| print $"cleaning up after: ($v.msg)" }
} catch {|e| $e.msg }
