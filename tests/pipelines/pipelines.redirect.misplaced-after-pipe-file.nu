# id: pipelines.redirect.misplaced-after-pipe-file
# rule: pipelines.redirect.misplaced
# expect: parse-error
# error: nu::parser::unexpected_redirection
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo | o> f.txt
