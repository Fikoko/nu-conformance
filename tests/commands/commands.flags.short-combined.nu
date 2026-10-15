# id: commands.flags.short-combined
# rule: commands.flags.short
# expect: output
# ---
# [true, true]
# ---
def f [--a (-a), --b (-b)] { [$a $b] }
f -ab | to nuon
