# id: flow.for.record-once
# rule: flow.for.single-value
# expect: output
# ---
# {a: 1, b: 2}
# ---
for x in {a: 1, b: 2} { print ($x | to nuon) }
