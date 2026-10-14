# id: types.nothing.optional-present-book
# rule: types.nothing.optional-access
# expect: output
# ---
# 5
# ---
let simple_record = { a: 5, b: 10 }
$simple_record.a?
