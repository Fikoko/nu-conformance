# id: pipelines.redirect.forms-out
# rule: pipelines.redirect.forms
# expect: output
# ---
# foo
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo out> f.txt
open --raw f.txt | str trim
