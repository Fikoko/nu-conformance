# id: flow.if.list-condition
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::cant_convert
if [] { 1 }
