# id: commands.params.no-space-after-colon
# rule: commands.params.types
# expect: output
# ---
# 1
# ---
def f [x:int] { $x }
f 1
