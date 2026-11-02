# id: pipelines.redirect.target-no-space
# rule: pipelines.redirect.target
# expect: output
# ---
# [foo, false]
# ---
let r = ^$nu.current-exe --no-config-file -c 'print foo' o>f.txt | str trim
[$r ('f.txt' | path exists)] | to nuon
