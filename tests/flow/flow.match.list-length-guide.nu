# id: flow.match.list-length-guide
# rule: flow.match.lists
# expect: output
# ---
# three items
# ---
match [1 2 3] { [$a, $b] => 'two items', [$a, $b, $c] => 'three items' }
