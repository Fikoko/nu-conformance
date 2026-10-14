# id: types.range.step-away-from-end
# rule: types.range.bad-step
# expect: runtime-error
# error: nu::shell::range_to_countable
1..0..5 | describe
