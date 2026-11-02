# id: modules.hide.scope-uncalled-def
# rule: modules.hide.scope
# expect: runtime-error
# error: nu::shell::external_command
def nu-conformance-f [] { 1 }
def g [] { hide nu-conformance-f }
nu-conformance-f
