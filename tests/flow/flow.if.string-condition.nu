# id: flow.if.string-condition
# rule: flow.if.condition
# expect: runtime-error
# error: nu::shell::cant_convert
if "true" { 1 }
