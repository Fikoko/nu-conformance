# id: pipelines.redirect.both-pipe-guide
# rule: pipelines.redirect.pipe
# expect: output
# ---
# [FOO, BARBAR]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o+e>| str uppercase | lines | sort -r | to nuon
