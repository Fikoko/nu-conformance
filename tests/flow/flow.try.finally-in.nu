# id: flow.try.finally-in
# rule: flow.try.finally
# expect: output
# ---
# ok
# ---
try { 'ok' } finally { print $in } | ignore
