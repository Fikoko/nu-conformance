# id: pipelines.redirect.blocks-do
# rule: pipelines.redirect.blocks
# expect: output
# ---
# foo
# ---
do { ^$nu.current-exe --no-config-file -c 'print foo' } o> f.txt
open --raw f.txt | str trim
