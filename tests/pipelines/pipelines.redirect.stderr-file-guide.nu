# id: pipelines.redirect.stderr-file-guide
# rule: pipelines.redirect.file
# expect: output
# ---
# barbar
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo e> file.txt o> out.txt
open --raw file.txt
