# id: declarations.unlet.guide
# rule: declarations.unlet.delete
# expect: runtime-error
# error: nu::shell::variable_not_found
let x = 42; unlet $x; $x
