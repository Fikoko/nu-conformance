# id: flow.for.not-in-pipeline-book
# rule: flow.for.statement
# expect: parse-error
# error: nu::parser::unexpected_keyword
[1 2 3] | for x in $in { $x + 1 } | $in ++ [5 6 7]
