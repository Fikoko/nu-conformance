# id: flow.if.else-on-next-line
# rule: flow.if.else
# expect: runtime-error
# error: nu::shell::external_command
if true { 1 }
else { 2 }
