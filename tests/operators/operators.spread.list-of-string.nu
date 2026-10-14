# id: operators.spread.list-of-string
# rule: operators.spread.list
# expect: runtime-error
# error: nu::shell::cannot_spread_as_list
let x = "s"
[...$x]
