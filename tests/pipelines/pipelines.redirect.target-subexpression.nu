# id: pipelines.redirect.target-subexpression
# rule: pipelines.redirect.target
# expect: output
# ---
# foo
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o> ("p" + ".txt") e> err.txt
open --raw p.txt | str trim
