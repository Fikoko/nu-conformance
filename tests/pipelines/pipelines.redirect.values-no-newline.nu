# id: pipelines.redirect.values-no-newline
# rule: pipelines.redirect.values
# expect: output
# ---
# [ab]
# ---
echo a o> f.txt; echo b o>> f.txt
open --raw f.txt | lines | to nuon
