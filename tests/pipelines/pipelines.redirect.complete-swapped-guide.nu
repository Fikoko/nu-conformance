# id: pipelines.redirect.complete-swapped-guide
# rule: pipelines.redirect.complete
# expect: output
# ---
# {stdout: barbar, stderr: foo}
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo e>| complete | select stdout stderr | update stdout { str trim } | update stderr { str trim } | to nuon
