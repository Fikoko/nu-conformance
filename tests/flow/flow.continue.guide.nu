# id: flow.continue.guide
# rule: flow.continue.skips
# expect: output
# ---
# 1
#   after
# 2
# 3
#   after
# ---
for x in [1 2 3] { print $x; if $x == 2 { continue }; print "  after" }
