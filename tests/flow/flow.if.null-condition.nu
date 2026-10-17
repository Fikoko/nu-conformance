# id: flow.if.null-condition
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::type_mismatch
# status: pending
if null { 1 }
