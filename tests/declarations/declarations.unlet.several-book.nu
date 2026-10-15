# id: declarations.unlet.several-book
# rule: declarations.unlet.delete
# expect: runtime-error
# error: nu::shell::variable_not_found
let a = 1
let b = 2
unlet $a $b
$a
