# id: commands.params.duplicate-short-flag
# rule: commands.params.duplicates
# expect: parse-error
# error: nu::parser::duplicate_parameter
# status: pending
def f [--x (-x), --y (-x)] { [$x $y] }
f -x | to nuon
