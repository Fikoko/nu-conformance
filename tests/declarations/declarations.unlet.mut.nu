# id: declarations.unlet.mut
# rule: declarations.unlet.delete
# expect: runtime-error
# error: nu::shell::variable_not_found
mut x = 1
unlet $x
$x
