# id: modules.use.spread-module-place
# rule: modules.use.spread
# expect: parse-error
# error: nu::parser::missing_positional
let x = 'std'
use ...$x
