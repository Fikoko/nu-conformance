# id: pipelines.redirect.file-output-null
# rule: pipelines.redirect.file-output
# expect: output
# ---
# nothing
# ---
let x = ^$nu.current-exe --no-config-file -c 'print foo' o> f.txt
$x | describe
