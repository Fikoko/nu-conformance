# id: pipelines.in.continue-pipeline-book
# rule: pipelines.in.no-input
# expect: output
# ---
# list<string>
# ---
[a b] | $in | describe
