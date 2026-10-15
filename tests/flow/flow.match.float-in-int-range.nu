# id: flow.match.float-in-int-range
# rule: flow.match.range-values
# expect: output
# ---
# out
# ---
match 1.5 { 1..2 => 'in', _ => 'out' }
