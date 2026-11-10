# id: commands.params.duplicate-flag
# rule: commands.params.duplicates
# expect: parse-error
# error: nu::parser::duplicate_parameter
def f [--x, --x] { $x }
f --x
