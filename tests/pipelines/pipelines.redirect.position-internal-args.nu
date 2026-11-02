# id: pipelines.redirect.position-internal-args
# rule: pipelines.redirect.position
# expect: output
# ---
# [a, b]
# ---
echo a o> f.txt b
open --raw f.txt | lines | to nuon
