# id: pipelines.types.first-book
# rule: pipelines.types
# expect: output
# ---
# [a, 1]
# ---
[([a b c] | first) (1..4 | first)] | to nuon
