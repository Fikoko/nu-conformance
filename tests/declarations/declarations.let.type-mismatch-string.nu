# id: declarations.let.type-mismatch-string
# rule: declarations.let.annotation
# expect: parse-error
# error: nu::parser::type_mismatch
let x: string = 1
