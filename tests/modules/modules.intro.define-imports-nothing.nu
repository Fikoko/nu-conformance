# id: modules.intro.define-imports-nothing
# rule: modules.intro
# expect: runtime-error
# error: nu::shell::external_command
module m { export def nu-conformance-f [] { 1 } }
nu-conformance-f
