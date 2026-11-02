# id: modules.hide.alias
# rule: modules.hide.command
# expect: runtime-error
# error: nu::shell::external_command
alias nu-conformance-a = echo a
hide nu-conformance-a
nu-conformance-a
