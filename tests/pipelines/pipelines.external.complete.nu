# id: pipelines.external.complete
# rule: pipelines.external.failure
# expect: output
# ---
# {stdout: foo, stderr: barbar, exit_code: 0}
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo | complete | update stdout { str trim } | update stderr { str trim } | to nuon
