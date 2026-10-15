# id: flow.for.empty-list
# rule: flow.for.iteration
# expect: output
# ---
# done
# ---
for x in [] { print $x }
"done"
