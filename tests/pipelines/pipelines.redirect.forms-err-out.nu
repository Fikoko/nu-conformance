# id: pipelines.redirect.forms-err-out
# rule: pipelines.redirect.forms
# expect: output
# ---
# [barbar, foo]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo err+out> f.txt
open --raw f.txt | lines | sort | to nuon
