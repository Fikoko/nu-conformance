# id: scripts.files.let-name-source
# rule: scripts.files
# expect: parse-error
# error: nu::parser::error
let p = 'lib.nu'
source $p
