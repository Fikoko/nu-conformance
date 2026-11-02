# id: modules.use.shadow-builtin
# rule: modules.use.shadow
# expect: output
# ---
# mine
# ---
module m { export def length [] { 'mine' } }
use m length
[1 2 3] | length
