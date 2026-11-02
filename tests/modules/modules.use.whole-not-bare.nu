# id: modules.use.whole-not-bare
# rule: modules.use.whole
# expect: runtime-error
# error: nu::shell::external_command
module m { export def nu-conformance-f [] { 1 } }
use m
nu-conformance-f
