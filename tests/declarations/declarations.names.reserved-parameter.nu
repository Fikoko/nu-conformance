# id: declarations.names.reserved-parameter
# rule: declarations.names.reserved
# expect: parse-error
# error: nu::parser::name_is_builtin_var
def f [nu] { 1 }
