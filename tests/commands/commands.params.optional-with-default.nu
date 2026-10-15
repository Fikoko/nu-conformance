# id: commands.params.optional-with-default
# rule: commands.params.default
# expect: output
# ---
# 5
# ---
def f [x?: int = 5] { $x }
f
