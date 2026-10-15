# id: flow.loop.book
# rule: flow.loop.repeat
# expect: output
# ---
# 11
# ---
mut x = 0; loop { if $x > 10 { break }; $x = $x + 1 }; $x
