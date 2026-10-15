# id: declarations.names.reserved-env
# rule: declarations.names.reserved
# expect: parse-error
# error: nu::parser::name_is_builtin_var
let env = 1
