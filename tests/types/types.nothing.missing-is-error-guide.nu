# id: types.nothing.missing-is-error-guide
# rule: types.nothing.missing-value
# expect: runtime-error
# error: nu::shell::column_not_found
let missing_value = [{a:1 b:2} {b:1}]
$missing_value.1.a
