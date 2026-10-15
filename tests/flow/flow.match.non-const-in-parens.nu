# id: flow.match.non-const-in-parens
# rule: flow.match.constants
# expect: parse-error
# error: nu::parser::error
let v = 5
match 5 { ($v) => 'yes', _ => 'no' }
