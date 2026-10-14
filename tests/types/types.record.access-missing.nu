# id: types.record.access-missing
# rule: types.record.access
# expect: runtime-error
# error: nu::shell::column_not_found
let r = {a: 1}
$r.b
