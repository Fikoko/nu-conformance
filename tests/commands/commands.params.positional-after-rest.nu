# id: commands.params.positional-after-rest
# rule: commands.params.after-rest
# expect: output
# ---
# {r: [2, 3], a: 1}
# ---
def f [...r, a] { {r: $r, a: $a} }
f 1 2 3 | to nuon
