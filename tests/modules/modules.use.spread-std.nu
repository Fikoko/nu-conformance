# id: modules.use.spread-std
# rule: modules.use.spread
# expect: output
# ---
# ok
# ---
let l = [math]
use std ...$l
'ok'
