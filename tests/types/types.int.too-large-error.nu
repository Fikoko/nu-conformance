# id: types.int.too-large-error
# rule: types.int.too-large
# expect: parse-error
# error: nu::parser::error
9223372036854775808 | describe
