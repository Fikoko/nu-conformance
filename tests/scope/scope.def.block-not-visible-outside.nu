# id: scope.def.block-not-visible-outside
# rule: scope.def.visibility
# expect: runtime-error
# error: nu::shell::external_command
if true { def nu-conformance-inner [] { 1 } }
nu-conformance-inner
