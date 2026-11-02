# id: pipelines.redirect.forms-e-o
# rule: pipelines.redirect.forms
# expect: output
# ---
# [barbar, foo]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo e+o> f.txt
open --raw f.txt | lines | sort | to nuon
