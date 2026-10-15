# id: commands.flags.short-only
# rule: commands.flags.short
# expect: output
# ---
# true
# ---
def f [-x] { $x }
f -x
