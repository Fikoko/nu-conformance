# id: types.list.spread-non-list
# rule: types.list.spread
# expect: runtime-error
# error: nu::shell::cannot_spread_as_list
let x = 5
[...$x]
