# id: pipelines.redirect.forms-err-out-pipe
# rule: pipelines.redirect.forms
# expect: output
# ---
# [barbar, foo]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo err+out>| lines | sort | to nuon
