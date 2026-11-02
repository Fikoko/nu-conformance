# id: modules.hide.scope-do
# rule: modules.hide.scope
# expect: runtime-error
# error: nu::shell::external_command
def nu-conformance-f [] { 1 }
do { hide nu-conformance-f }
nu-conformance-f
