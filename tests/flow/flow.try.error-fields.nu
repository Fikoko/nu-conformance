# id: flow.try.error-fields
# rule: flow.try.error-record
# expect: output
# ---
# [msg, debug, raw, rendered, details]
# ---
try { 1 / 0 } catch {|e| $e | columns } | to nuon
