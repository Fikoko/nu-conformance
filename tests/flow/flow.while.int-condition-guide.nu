# id: flow.while.int-condition-guide
# rule: flow.while.condition
# expect: runtime-error
# error: nu::shell::type_mismatch
while 1 { break }
