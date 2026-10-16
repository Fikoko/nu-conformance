# id: pipelines.external.stderr-to-terminal
# rule: pipelines.external.output
# expect: output
# ---
# FOO
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
let r = (^$nu.current-exe --no-config-file -c "def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }; demo | str uppercase" | complete)
$r.stdout
