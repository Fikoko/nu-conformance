# id: commands.flags.wrong-type
# rule: commands.flags.value
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [--x: int] { $x }
f --x a
