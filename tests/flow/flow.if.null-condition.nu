# id: flow.if.null-condition
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::cant_convert
if null { 1 }
