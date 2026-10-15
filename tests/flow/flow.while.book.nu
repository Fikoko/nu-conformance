# id: flow.while.book
# rule: flow.while.condition
# expect: output
# ---
# 10
# ---
mut x = 0; while $x < 10 { $x = $x + 1 }; $x
