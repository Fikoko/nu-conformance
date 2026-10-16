# id: pipelines.in.collects-stream
# rule: pipelines.in.collect
# expect: output
# ---
# list<int>
# ---
1..3 | each {||} | $in | describe
