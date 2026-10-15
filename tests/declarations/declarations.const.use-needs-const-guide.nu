# id: declarations.const.use-needs-const-guide
# rule: declarations.const.constant-operands
# expect: parse-error
# error: nu::parser::error
let lib = "greet.nu"
use $lib hello
