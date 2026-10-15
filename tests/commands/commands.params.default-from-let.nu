# id: commands.params.default-from-let
# rule: commands.params.default-constant
# expect: parse-error
# error: nu::parser::non_constant_default_value
let d = 5
def f [x = $d] { $x }
