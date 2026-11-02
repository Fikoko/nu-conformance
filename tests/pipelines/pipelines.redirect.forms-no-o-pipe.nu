# id: pipelines.redirect.forms-no-o-pipe
# rule: pipelines.redirect.forms
# expect: parse-error
# error: nu::parser::parse_mismatch
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o>| str length
