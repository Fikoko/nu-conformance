# id: modules.define.private-used-inside
# rule: modules.define.exports
# expect: output
# ---
# 1
# ---
module m { def private [] { 1 }; export def public [] { private } }
use m *
public
