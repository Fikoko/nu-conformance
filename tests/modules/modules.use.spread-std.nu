# id: modules.use.spread-std
# rule: modules.use.spread
# expect: parse-error
# error: nu::parser::wrong_import_pattern
# status: pending
let l = [math]
use std ...$l
'ok'
