# id: commands.params.number
# rule: commands.params.types
# expect: output
# ---
# [1, 1.5]
# ---
def f [x: number] { $x }
[(f 1) (f 1.5)] | to nuon
