# id: flow.try.finally-no-mut
# rule: flow.try.mut
# expect: parse-error
# error: nu::parser::expected_keyword
mut x = 0
try { 1 } finally { $x = 1 }
