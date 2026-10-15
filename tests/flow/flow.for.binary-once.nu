# id: flow.for.binary-once
# rule: flow.for.single-value
# expect: output
# ---
# binary
# ---
for x in 0x[0102] { print ($x | describe) }
