# id: commands.names.subcommand-prefix-alone
# rule: commands.names.subcommands
# expect: runtime-error
# error: nu::shell::external_command
def "nu-conformance-a b" [] { 1 }
nu-conformance-a
