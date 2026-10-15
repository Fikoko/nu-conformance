# id: flow.for.null-zero-times
# rule: flow.for.single-value
# expect: output
# ---
# done
# ---
for x in null { print $x }
"done"
