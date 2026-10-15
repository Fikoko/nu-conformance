# id: flow.match.const-guide
# rule: flow.match.constants
# expect: output
# ---
# expected
# ---
const expected = 5
match 5 { ($expected) => 'expected', _ => 'unexpected' }
