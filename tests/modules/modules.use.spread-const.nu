# id: modules.use.spread-const
# rule: modules.use.spread
# expect: runtime-error
# error: nu::shell::external_command
module m { export def nu-conformance-f [] { 'f' } }
const l = [nu-conformance-f]
use m ...$l
nu-conformance-f
