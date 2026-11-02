# id: parsing.source.cr-only
# rule: parsing.source.line-endings
# expect: parse-error
# error: nu::parser::parse_mismatch
let x = 1let y = 2$x + $y
