# id: modules.hide.def
# rule: modules.hide.command
# expect: runtime-error
# error: nu::shell::external_command
def nu-conformance-f [] { 'local' }
hide nu-conformance-f
nu-conformance-f
