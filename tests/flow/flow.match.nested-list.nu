# id: flow.match.nested-list
# rule: flow.match.lists
# expect: output
# ---
# 3
# ---
match [[1 2] [3]] { [[$a, $b], [$c]] => ($a + $b), _ => 0 }
