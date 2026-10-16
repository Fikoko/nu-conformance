# id: pipelines.redirect.stderr-pipe-guide
# rule: pipelines.redirect.pipe
# expect: output
# ---
# BARBAR
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
let result = demo o> out.txt e>| str uppercase | str trim
$result
