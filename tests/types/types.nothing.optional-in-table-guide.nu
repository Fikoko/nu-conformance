# id: types.nothing.optional-in-table-guide
# rule: types.nothing.optional-access
# expect: output
# ---
# nothing
# ---
let missing_value = [{a:1 b:2} {b:1}]
$missing_value.1.a? | describe
