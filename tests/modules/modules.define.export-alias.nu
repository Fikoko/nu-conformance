# id: modules.define.export-alias
# rule: modules.define.exports
# expect: output
# ---
# hi
# ---
module m { export alias a = echo hi }
use m a
a
