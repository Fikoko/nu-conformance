# id: flow.try.catch-value-guide
# rule: flow.try.value
# expect: output
# ---
# 0
# ---
let n = try { "abc" | into int } catch { 0 }
$n
