# id: declarations.names.reserved-in
# rule: declarations.names.reserved
# expect: parse-error
# error: nu::parser::name_is_builtin_var
let in = 1
