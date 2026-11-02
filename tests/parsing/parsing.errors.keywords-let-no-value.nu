# id: parsing.errors.keywords-let-no-value
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::keyword_missing_arg
let x = ; let y =
