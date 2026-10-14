# id: operators.not.binds-to-variable
# rule: operators.not.operand
# expect: runtime-error
# error: nu::shell::cant_convert
let x = 1
not $x == 2
