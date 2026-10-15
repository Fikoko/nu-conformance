# id: flow.try.error-in-catch-propagates-guide
# rule: flow.try.catch-errors
# expect: runtime-error
# error: nu::shell::error
try { error make {msg: a} } catch {|e| error make {msg: b} }
