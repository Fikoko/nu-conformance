# id: flow.for.not-first-in-pipeline
# rule: flow.for.statement
# expect: parse-error
# error: nu::parser::unexpected_keyword
for x in [1] { $x } | describe
