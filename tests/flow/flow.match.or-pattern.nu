# id: flow.match.or-pattern
# rule: flow.match.literals
# expect: output
# ---
# small
# ---
match 2 { 1 | 2 | 3 => 'small', _ => 'other' }
