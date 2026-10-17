# id: types.duration.just-over-max-error
# rule: types.duration.range
# expect: parse-error
# error: nu::parser::literal_too_large
# status: pending
9223372036854775808ns | to nuon
