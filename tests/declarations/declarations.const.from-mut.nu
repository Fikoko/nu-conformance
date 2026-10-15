# id: declarations.const.from-mut
# rule: declarations.const.constant-operands
# expect: parse-error
# error: nu::parser::error
mut m = 1
const y = $m
