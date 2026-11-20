# id: modules.use.spread-const
# rule: modules.use.spread
# expect: parse-error
# error: nu::parser::wrong_import_pattern
# status: pending
module m { export def nu-conformance-f [] { 'f' } }
const l = [nu-conformance-f]
use m ...$l
nu-conformance-f
