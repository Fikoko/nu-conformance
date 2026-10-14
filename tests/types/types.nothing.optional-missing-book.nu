# id: types.nothing.optional-missing-book
# rule: types.nothing.optional-access
# expect: output
# ---
# nothing
# ---
let simple_record = { a: 5, b: 10 }
$simple_record.c? | describe
