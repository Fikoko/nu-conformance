# id: flow.match.list-rest-unbound
# rule: flow.match.lists
# expect: output
# ---
# at least two
# ---
match [1 2 3] { [$a, $b, ..] => 'at least two', _ => 'x' }
