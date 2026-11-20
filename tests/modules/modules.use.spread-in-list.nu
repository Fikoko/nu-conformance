# id: modules.use.spread-in-list
# rule: modules.use.spread
# expect: parse-error
# error: nu::parser::wrong_import_pattern
module m { export def f [] { 'f' } }
const l = [f]
use m [...$l]
