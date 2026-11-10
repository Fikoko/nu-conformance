# id: declarations.unlet.const-hidden
# rule: declarations.unlet.const
# expect: parse-error
# error: nu::parser::variable_not_found
const x = 1
unlet $x
$x
