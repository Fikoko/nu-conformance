# id: flow.try.raw-reraises
# rule: flow.try.catch-errors
# expect: output
# ---
# logging
# Division by zero.
# ---
try { try { 1 / 0 } catch {|e| print logging; $e.raw } } catch {|e| $e.msg }
