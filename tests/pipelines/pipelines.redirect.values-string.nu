# id: pipelines.redirect.values-string
# rule: pipelines.redirect.values
# expect: output
# ---
# abc
# ---
"abc" o> f.txt
open --raw f.txt
