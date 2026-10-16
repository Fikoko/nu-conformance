# id: pipelines.redirect.stdout-pipe-guide
# rule: pipelines.redirect.pipe
# expect: output
# ---
# FOO
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
let result = demo | str uppercase | str trim
$result
