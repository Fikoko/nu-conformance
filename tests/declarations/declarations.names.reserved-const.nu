# id: declarations.names.reserved-const
# rule: declarations.names.reserved
# expect: parse-error
# error: nu::parser::name_is_builtin_var
const env = 1
