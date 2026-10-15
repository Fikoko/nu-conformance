# id: flow.try.no-catch-is-null-guide
# rule: flow.try.value
# expect: output
# ---
# nothing
# ---
try { 1 / 0 } | describe
