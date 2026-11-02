# id: pipelines.redirect.same-file-accepted
# rule: pipelines.redirect.same-file
# expect: output
# ---
# ok
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo e> f.txt o> f.txt
'ok'
