# id: pipelines.in.after-semicolon-book
# rule: pipelines.in.no-input
# expect: output
# ---
# nothing
# ---
[a b] | get 0; $in | describe
