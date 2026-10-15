# id: flow.match.first-wins
# rule: flow.match.arms
# expect: output
# ---
# first
# ---
match 1 { 1 => 'first', 1 => 'second' }
