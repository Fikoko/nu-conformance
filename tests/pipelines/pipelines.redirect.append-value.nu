# id: pipelines.redirect.append-value
# rule: pipelines.redirect.append
# expect: output
# ---
# abcx
# ---
"abc" | save f.txt
"x" o>> f.txt
open --raw f.txt
