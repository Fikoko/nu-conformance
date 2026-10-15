# id: commands.params.two-rest
# rule: commands.params.order
# expect: parse-error
# error: nu::parser::multiple_rest_params
def f [...r, ...s] { 1 }
