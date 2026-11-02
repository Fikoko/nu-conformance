# id: modules.use.files-syntax-error
# rule: modules.use.files
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
'x' | save ran.txt
use m.nu
