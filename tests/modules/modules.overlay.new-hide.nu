# id: modules.overlay.new-hide
# rule: modules.overlay.new
# expect: runtime-error
# error: nu::shell::external_command
overlay new scratch
def nu-conformance-g [] { 'g' }
overlay hide scratch
nu-conformance-g
