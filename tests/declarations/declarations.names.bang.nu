# id: declarations.names.bang
# rule: declarations.names.characters
# expect: parse-error
# error: nu::parser::parse_mismatch
let a!b = 1
