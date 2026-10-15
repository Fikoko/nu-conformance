# id: flow.for.mut-accumulate-book
# rule: flow.for.variable
# expect: output
# ---
# [2, 3, 4]
# ---
mut result = []
for $it in [1 2 3] { $result = ($result | append ($it + 1)) }
$result | to nuon
