# id: pipelines.redirect.position-external-args
# rule: pipelines.redirect.position
# expect: output
# ---
# foo
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o> f.txt e> err.txt
open --raw f.txt | str trim
