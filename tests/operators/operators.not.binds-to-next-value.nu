# id: operators.not.binds-to-next-value
# rule: operators.not.operand
# expect: runtime-error
# error: nu::shell::cant_convert
not "a" == "b"
