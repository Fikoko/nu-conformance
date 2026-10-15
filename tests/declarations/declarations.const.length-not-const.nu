# id: declarations.const.length-not-const
# rule: declarations.const.commands
# expect: parse-error
# error: nu::parser::error
const x = [1 2] | length
