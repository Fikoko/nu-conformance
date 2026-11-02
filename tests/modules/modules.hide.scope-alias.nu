# id: modules.hide.scope-alias
# rule: modules.hide.scope
# expect: runtime-error
# error: nu::shell::external_command
alias nu-conformance-a = echo a
do { hide nu-conformance-a }
nu-conformance-a
