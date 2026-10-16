# id: pipelines.redirect.multiple-guide
# rule: pipelines.redirect.multiple
# expect: parse-error
# error: nu::parser::multiple_redirections
def --wrapped demo [...rest] { ^$nu.current-exe --no-config-file -c 'print foo; print -e barbar' ...$rest }
demo o> file.txt o+e>| str uppercase
