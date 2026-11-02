# id: pipelines.redirect.values-list
# rule: pipelines.redirect.values
# expect: output
# ---
# 0x[310A320A]
# ---
[1 2] o> f.txt
open --raw f.txt | into binary | to nuon
