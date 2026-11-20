# id: modules.use.spread-let
# rule: modules.use.spread
# expect: parse-error
# error: nu::parser::wrong_import_pattern
# status: pending
module m { export def f [] { 'f' }; export def g [] { 'g' } }
let l = [f g]
use m ...$l
'ok'
