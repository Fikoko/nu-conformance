# id: commands.params.duplicate-short-flag
# rule: commands.params.duplicates
# expect: output
# ---
# [true, false]
# ---
def f [--x (-x), --y (-x)] { [$x $y] }
f -x | to nuon
