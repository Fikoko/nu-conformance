# id: modules.use.std-constant-book
# rule: modules.use.std
# expect: output
# ---
# 3.14
# ---
use std/math PI
$PI | math round --precision 2
