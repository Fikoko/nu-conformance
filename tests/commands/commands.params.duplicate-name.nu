# id: commands.params.duplicate-name
# rule: commands.params.duplicates
# expect: output
# ---
# 2
# ---
def f [a, a] { $a }
f 1 2
