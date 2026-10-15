# id: flow.break.no-value-guide
# rule: flow.break.placement
# expect: parse-error
# error: nu::parser::extra_positional
for x in [1 2] { break 5 }
