# id: types.int.too-small-error
# rule: types.int.too-large
# expect: parse-error
# error: nu::parser::error
# status: pending
-9223372036854775809 | describe
