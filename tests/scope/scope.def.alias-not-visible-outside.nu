# id: scope.def.alias-not-visible-outside
# rule: scope.def.visibility
# expect: runtime-error
# error: nu::shell::external_command
do { alias nu-conformance-ll = ls }
nu-conformance-ll
