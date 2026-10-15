# id: commands.flags.missing-value
# rule: commands.flags.value
# expect: parse-error
# error: nu::parser::missing_flag_param
def f [--x: int] { $x }
f --x
