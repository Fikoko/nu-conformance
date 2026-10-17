# id: types.int.too-large-annotated
# rule: types.int.too-large
# expect: parse-error
# error: nu::parser::error
# status: pending
let x: int = 9223372036854775808
