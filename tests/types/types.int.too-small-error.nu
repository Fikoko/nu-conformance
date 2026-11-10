# id: types.int.too-small-error
# rule: types.int.too-large
# expect: parse-error
# error: nu::parser::error
-9223372036854775809 | describe
