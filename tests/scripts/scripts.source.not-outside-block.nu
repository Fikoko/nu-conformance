# id: scripts.source.not-outside-block
# rule: scripts.source.nested
# expect: runtime-error
# error: nu::shell::external_command
do { source lib.nu }
nu-conformance-libf
