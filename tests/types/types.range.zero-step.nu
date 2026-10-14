# id: types.range.zero-step
# rule: types.range.bad-step
# expect: runtime-error
# error: nu::shell::range_to_countable
1..1..5 | describe
