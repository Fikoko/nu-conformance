# id: pipelines.external.internal-to-stdin
# rule: pipelines.external.input
# expect: output
# ---
# 3
# ---
"abc" | ^$nu.current-exe --no-config-file --stdin -c '$in | str length'
