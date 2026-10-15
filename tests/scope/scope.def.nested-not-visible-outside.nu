# id: scope.def.nested-not-visible-outside
# rule: scope.def.visibility
# expect: runtime-error
# error: nu::shell::external_command
def outer [] { def nu-conformance-helper [] { 'helper' }; 1 }
outer
nu-conformance-helper
