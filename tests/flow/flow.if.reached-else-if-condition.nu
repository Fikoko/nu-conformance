# id: flow.if.reached-else-if-condition
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::type_mismatch
# status: pending
if false { 1 } else if 1 { 2 }
