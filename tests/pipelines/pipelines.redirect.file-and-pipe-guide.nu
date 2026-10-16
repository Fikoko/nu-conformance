# id: pipelines.redirect.file-and-pipe-guide
# rule: pipelines.redirect.file
# expect: output
# ---
# BARBAR
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o> file.txt e>| str uppercase | str trim
