# id: parsing.errors.first-in-source-order
# rule: parsing.errors.first
# expect: parse-error
# error: nu::parser::keyword_missing_arg
let x = ; 1 +
