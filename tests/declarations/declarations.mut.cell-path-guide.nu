# id: declarations.mut.cell-path-guide
# rule: declarations.mut.binding
# expect: output
# ---
# {a: {b: 2}, c: 3}
# ---
mut rec = {a: {b: 1}}; $rec.a.b = 2; $rec.c = 3; $rec | to nuon
