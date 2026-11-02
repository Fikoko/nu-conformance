# id: scripts.source.syntax-error
# rule: scripts.source.errors
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
'x' | save ran.txt
source lib.nu
