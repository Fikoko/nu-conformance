# id: commands.sig.compound-type
# rule: commands.sig.declare
# expect: output
# ---
# 2
# ---
def f []: list<int> -> int { length }
[1 2] | f
