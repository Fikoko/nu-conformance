# id: flow.if.int-condition-guide
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::type_mismatch
# status: pending
if 1 { "yes" }
