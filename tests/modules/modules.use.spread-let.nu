# id: modules.use.spread-let
# rule: modules.use.spread
# expect: output
# ---
# ok
# ---
module m { export def f [] { 'f' }; export def g [] { 'g' } }
let l = [f g]
use m ...$l
'ok'
