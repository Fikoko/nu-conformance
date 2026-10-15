# id: flow.match.record-shorthand
# rule: flow.match.records
# expect: output
# ---
# 1
# ---
match {name: 1, other: 2} { {$name} => $name }
