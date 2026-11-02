# id: modules.hide.scope-if
# rule: modules.hide.scope
# expect: runtime-error
# error: nu::shell::external_command
def nu-conformance-f [] { 1 }
if true { hide nu-conformance-f }
nu-conformance-f
