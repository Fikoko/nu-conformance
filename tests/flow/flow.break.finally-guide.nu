# id: flow.break.finally-guide
# rule: flow.break.stops
# expect: output
# ---
# cleanup
# done
# ---
for i in 1..3 { try { break } finally { print "cleanup" } }; print done
