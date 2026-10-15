# id: flow.try.assign-result-guide
# rule: flow.try.mut
# expect: output
# ---
# 1
# ---
mut x = 0
$x = try { error make {msg: a} } catch { 1 }
$x
