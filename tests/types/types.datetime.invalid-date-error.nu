# id: types.datetime.invalid-date-error
# rule: types.datetime.invalid
# expect: parse-error
# error: nu::parser::error
# status: pending
[2022-02-30 2023-02-29 2022-13-01] | describe
