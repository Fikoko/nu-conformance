# id: pipelines.in.types-book
# rule: pipelines.in.no-input
# expect: output
# ---
# [int, string, closure, nothing]
# ---
[(1 | do { $in | describe }) ("Hello, Nushell" | do { $in | describe }) ({||} | do { $in | describe }) (do { $in | describe })] | to nuon
