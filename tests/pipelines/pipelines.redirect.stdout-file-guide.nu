# id: pipelines.redirect.stdout-file-guide
# rule: pipelines.redirect.file
# expect: output
# ---
# foo
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o> file.txt
open --raw file.txt
