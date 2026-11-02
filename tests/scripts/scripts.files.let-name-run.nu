# id: scripts.files.let-name-run
# rule: scripts.files
# expect: parse-error
# error: nu::parser::error
let p = 's.nu'
run $p
