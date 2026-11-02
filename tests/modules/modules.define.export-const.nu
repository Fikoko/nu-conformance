# id: modules.define.export-const
# rule: modules.define.exports
# expect: output
# ---
# 5
# ---
module m { export const x = 5 }
use m *
$x
