# id: flow.while.closure-condition-guide
# rule: flow.while.condition
# expect: parse-error
# error: nu::parser::expected_keyword
mut x = 0; while { $x < 3 } { $x += 1 }
