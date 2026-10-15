# id: flow.try.input-guide
# rule: flow.try.value
# expect: output
# ---
# 6
# ---
[1 2 3] | try { math sum } catch { 0 }
