# id: declarations.let.immutable-guide
# rule: declarations.let.immutable
# expect: parse-error
# error: nu::parser::assignment_requires_mutable_variable
let x = 1; $x = 2
