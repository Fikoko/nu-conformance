# id: pipelines.redirect.append-external
# rule: pipelines.redirect.append
# expect: output
# ---
# [foo, foo]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o>> f.txt
demo o>> f.txt
open --raw f.txt | lines | to nuon
