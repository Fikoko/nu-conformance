# id: modules.use.whole-const-record
# rule: modules.use.whole
# expect: output
# ---
# 5
# ---
module m { export const x = 5 }
use m
$m.x
