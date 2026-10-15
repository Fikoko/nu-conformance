# id: declarations.const.not-const-command-guide
# rule: declarations.const.parse-time
# expect: parse-error
# error: nu::parser::error
const x = (ls | length)
