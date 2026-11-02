# id: pipelines.redirect.append-stderr
# rule: pipelines.redirect.append
# expect: output
# ---
# [barbar, barbar]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo e>> f.txt o> out.txt
demo e>> f.txt o> out.txt
open --raw f.txt | lines | to nuon
