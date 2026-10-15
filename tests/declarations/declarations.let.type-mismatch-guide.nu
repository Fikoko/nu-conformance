# id: declarations.let.type-mismatch-guide
# rule: declarations.let.annotation
# expect: parse-error
# error: nu::parser::type_mismatch
let x: int = "ten"
