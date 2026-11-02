# id: parsing.errors.keywords-let-colon-no-type
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::missing_type
let x: = 1
