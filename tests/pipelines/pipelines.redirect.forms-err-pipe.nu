# id: pipelines.redirect.forms-err-pipe
# rule: pipelines.redirect.forms
# expect: output
# ---
# BARBAR
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo out> out.txt err>| str upcase | str trim
