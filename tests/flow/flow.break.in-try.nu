# id: flow.break.in-try
# rule: flow.break.stops
# expect: output
# ---
# 1
# ---
for x in [1 2 3] { try { if $x == 2 { break }; print $x } catch { print c } }
