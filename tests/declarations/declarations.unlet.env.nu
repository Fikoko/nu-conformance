# id: declarations.unlet.env
# rule: declarations.unlet.builtins
# expect: compile-error
# error: nu::compile::invalid_literal
unlet $env
