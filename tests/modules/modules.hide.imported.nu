# id: modules.hide.imported
# rule: modules.hide.command
# expect: runtime-error
# error: nu::shell::external_command
module m { export def nu-conformance-f [] { 'm' } }
use m nu-conformance-f
hide nu-conformance-f
nu-conformance-f
