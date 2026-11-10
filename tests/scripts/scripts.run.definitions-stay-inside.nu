# id: scripts.run.definitions-stay-inside
# rule: scripts.run.definitions
# expect: runtime-error
# error: nu::shell::external_command
run h.nu | ignore
nu-conformance-helper
