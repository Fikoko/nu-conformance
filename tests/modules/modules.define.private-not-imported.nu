# id: modules.define.private-not-imported
# rule: modules.define.exports
# expect: runtime-error
# error: nu::shell::external_command
module m { def nu-conformance-private [] { 1 }; export def public [] { nu-conformance-private } }
use m *
nu-conformance-private
