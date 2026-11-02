# id: pipelines.redirect.target-variable
# rule: pipelines.redirect.target
# expect: output
# ---
# foo
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
let name = "v.txt"
demo o> $name e> err.txt
open --raw v.txt | str trim
