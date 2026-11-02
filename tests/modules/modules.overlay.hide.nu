# id: modules.overlay.hide
# rule: modules.overlay.hide
# expect: runtime-error
# error: nu::shell::external_command
module m { export def nu-conformance-f [] { 1 } }
overlay use m
overlay hide m
nu-conformance-f
