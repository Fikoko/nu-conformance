# id: operators.spread.flags-builtin-book
# rule: operators.spread.flags
# expect: output
# ---
# [3, 2, 1]
# ---
let sort_options = { reverse: true }
[3 1 2] | sort ...$sort_options | to nuon
