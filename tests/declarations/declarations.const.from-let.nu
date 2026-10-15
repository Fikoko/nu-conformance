# id: declarations.const.from-let
# rule: declarations.const.constant-operands
# expect: parse-error
# error: nu::parser::error
let a = 1
const y = $a
