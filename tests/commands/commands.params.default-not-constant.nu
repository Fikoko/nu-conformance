# id: commands.params.default-not-constant
# rule: commands.params.default-constant
# expect: parse-error
# error: nu::parser::non_constant_default_value
def f [x = (date now)] { $x }
