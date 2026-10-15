# id: flow.continue.finally-guide
# rule: flow.continue.skips
# expect: output
# ---
# finally 1
# finally 2
# ---
for i in 1..2 { try { continue } finally { print $"finally ($i)" } }
