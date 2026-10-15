# id: flow.try.catch-no-mut-guide
# rule: flow.try.mut
# expect: parse-error
# error: nu::parser::expected_keyword
mut x = 0; try { error make {msg: a} } catch { $x = 1 }
