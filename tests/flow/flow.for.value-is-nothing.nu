# id: flow.for.value-is-nothing
# rule: flow.for.statement
# expect: output
# ---
# nothing
# ---
(for x in [1] { $x }) | describe
