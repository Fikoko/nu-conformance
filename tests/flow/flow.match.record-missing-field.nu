# id: flow.match.record-missing-field
# rule: flow.match.records
# expect: output
# ---
# no
# ---
match {a: 1} { {a: $x, b: $y} => 'yes', _ => 'no' }
