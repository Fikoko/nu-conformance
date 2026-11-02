# id: modules.use.position-not-outside-block
# rule: modules.use.position
# expect: runtime-error
# error: nu::shell::external_command
module m { export def nu-conformance-f [] { 1 } }
do { use m nu-conformance-f }
nu-conformance-f
