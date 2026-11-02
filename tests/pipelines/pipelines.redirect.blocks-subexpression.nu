# id: pipelines.redirect.blocks-subexpression
# rule: pipelines.redirect.blocks
# expect: output
# ---
# foo
# ---
(^$nu.current-exe --no-config-file -c 'print foo') o> f.txt
open --raw f.txt | str trim
