# id: pipelines.redirect.stderr-file-and-pipe-guide
# rule: pipelines.redirect.file
# expect: output
# ---
# FOO
# ---
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo e> file.txt | str uppercase | str trim
