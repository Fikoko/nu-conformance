# id: pipelines.redirect.forms-e-o-pipe
# rule: pipelines.redirect.forms
# expect: output
# ---
# [barbar, foo]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo e+o>| lines | sort | to nuon
