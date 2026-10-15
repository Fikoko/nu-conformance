# id: flow.if.int-condition-guide
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::cant_convert
if 1 { "yes" }
