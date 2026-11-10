# id: flow.if.int-condition-guide
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::type_mismatch
if 1 { "yes" }
