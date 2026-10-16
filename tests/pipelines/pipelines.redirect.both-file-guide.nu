# id: pipelines.redirect.both-file-guide
# rule: pipelines.redirect.order
# expect: output
# ---
# [barbar, foo]
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o+e> file.txt
open --raw file.txt | lines | sort | to nuon
