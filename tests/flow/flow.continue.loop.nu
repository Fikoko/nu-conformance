# id: flow.continue.loop
# rule: flow.continue.skips
# expect: output
# ---
# 1
# 3
# ---
mut i = 0; loop { $i += 1; if $i > 3 { break }; if $i == 2 { continue }; print $i }
