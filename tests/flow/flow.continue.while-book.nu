# id: flow.continue.while-book
# rule: flow.continue.skips
# expect: output
# ---
# 1
# 2
# 4
# 5
# 7
# ---
mut x = -1; while $x <= 6 { $x = $x + 1; if $x mod 3 == 0 { continue }; print $x }
