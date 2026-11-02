# id: modules.overlay.hide-file
# rule: modules.overlay.hide
# expect: runtime-error
# error: nu::shell::external_command
overlay use m.nu
overlay hide m
nu-conformance-f
