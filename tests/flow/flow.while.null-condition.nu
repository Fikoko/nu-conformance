# id: flow.while.null-condition
# rule: flow.while.condition
# expect: runtime-error
# error: nu::shell::type_mismatch
while null { break }
