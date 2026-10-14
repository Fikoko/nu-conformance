# id: types.nothing.optional-equals-null-book
# rule: types.nothing.optional-access
# expect: output
# ---
# true
# ---
let simple_record = { a: 5, b: 10 }
$simple_record.c? == null
