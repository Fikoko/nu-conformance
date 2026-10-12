# id: strings.backtick.let-is-command-position
# rule: strings.backtick.command-position
# expect: runtime-error
# error: nu::shell::external_command
let x = `nu-conformance no such command`
