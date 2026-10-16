# id: commands.sig.multiple-commas-guide
# rule: commands.sig.declare
# expect: output
# ---
# [1, a]
# ---
def f []: [int -> int, string -> string] { $in }
[(1 | f) ('a' | f)] | to nuon
