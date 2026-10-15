# id: flow.try.error-msg-book
# rule: flow.try.error-record
# expect: output
# ---
# Division by zero.
# ---
try { 1 / 0 } catch {|err| $err.msg }
