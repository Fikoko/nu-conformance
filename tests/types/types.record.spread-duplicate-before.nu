# id: types.record.spread-duplicate-before
# rule: types.record.spread
# expect: runtime-error
# error: nu::shell::column_defined_twice
let r = {a: 1}
{a: 0, ...$r}
