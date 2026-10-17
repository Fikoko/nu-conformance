# id: flow.if.string-condition
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::type_mismatch
# status: pending
if "true" { 1 }
