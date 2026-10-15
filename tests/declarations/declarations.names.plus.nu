# id: declarations.names.plus
# rule: declarations.names.characters
# expect: parse-error
# error: nu::parser::parse_mismatch
let x+y = 1
