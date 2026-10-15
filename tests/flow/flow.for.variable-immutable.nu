# id: flow.for.variable-immutable
# rule: flow.for.variable
# expect: parse-error
# error: nu::parser::assignment_requires_mutable_variable
for x in [1 2] { $x = 5 }
