# id: flow.for.error-book
# rule: flow.for.statement
# expect: runtime-error
# error: nu::shell::error
for x in [0] { error make { msg: "Custom error" } }
