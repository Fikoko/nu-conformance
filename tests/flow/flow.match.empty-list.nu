# id: flow.match.empty-list
# rule: flow.match.lists
# expect: output
# ---
# [empty, "not empty"]
# ---
[(match [] { [] => 'empty', _ => 'not empty' }) (match [1] { [] => 'empty', _ => 'not empty' })] | to nuon
