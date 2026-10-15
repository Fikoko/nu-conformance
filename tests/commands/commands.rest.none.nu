# id: commands.rest.none
# rule: commands.rest.collect
# expect: output
# ---
# []
# ---
def f [...names] { $names }
f | to nuon
