# id: commands.params.oneof
# rule: commands.params.types
# expect: output
# ---
# [1, a]
# ---
def f [x: oneof<int, string>] { $x }
[(f 1) (f a)] | to nuon
