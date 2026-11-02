# id: pipelines.redirect.target-quoted
# rule: pipelines.redirect.target
# expect: output
# ---
# foo
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o> "f g.txt" e> err.txt
open --raw "f g.txt" | str trim
