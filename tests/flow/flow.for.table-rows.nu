# id: flow.for.table-rows
# rule: flow.for.iteration
# expect: output
# ---
# {a: 1}
# {a: 2}
# ---
for x in [[a]; [1] [2]] { print ($x | to nuon) }
