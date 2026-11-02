# id: parsing.errors.keywords-let-unknown-type
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::unknown_type
let x: intt = 1
