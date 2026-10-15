# id: flow.match.guard-guide
# rule: flow.match.guards
# expect: output
# ---
# ascending
# ---
match [1, 2] { [$a, $b] if $a > $b => 'descending', [$a, $b] => 'ascending' }
