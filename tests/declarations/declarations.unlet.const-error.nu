# id: declarations.unlet.const-error
# rule: declarations.unlet.const
# expect: compile-error
# error: nu::compile::invalid_literal
# status: pending
const x = 1
unlet $x
$x
