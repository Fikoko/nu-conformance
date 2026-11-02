# id: pipelines.redirect.forms-err
# rule: pipelines.redirect.forms
# expect: output
# ---
# barbar
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo err> f.txt out> out.txt
open --raw f.txt | str trim
