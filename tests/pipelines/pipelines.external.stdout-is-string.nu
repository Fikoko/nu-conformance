# id: pipelines.external.stdout-is-string
# rule: pipelines.external.output
# expect: output
# ---
# [foo]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo | lines | to nuon
