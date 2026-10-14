# id: types.record.spread-duplicate
# rule: types.record.spread
# expect: runtime-error
# error: nu::shell::column_defined_twice
let r = {a: 1}
{...$r, a: 2}
