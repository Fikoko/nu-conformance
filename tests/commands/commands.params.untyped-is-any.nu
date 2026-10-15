# id: commands.params.untyped-is-any
# rule: commands.params.types
# expect: output
# ---
# [int, string, list<int>]
# ---
def f [x] { $x | describe }
[(f 1) (f a) (f [1 2])] | to nuon
