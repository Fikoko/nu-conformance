# id: flow.continue.no-value
# rule: flow.continue.placement
# expect: parse-error
# error: nu::parser::extra_positional
for x in [1 2] { continue 5 }
