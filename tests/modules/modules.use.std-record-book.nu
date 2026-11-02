# id: modules.use.std-record-book
# rule: modules.use.std
# expect: output
# ---
# 3.14
# ---
use std/math
$math.PI | math round --precision 2
