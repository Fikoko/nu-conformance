# id: declarations.unlet.in-error
# rule: declarations.unlet.builtins
# expect: compile-error
# error: nu::compile::invalid_literal
# status: pending
unlet $in
'done'
