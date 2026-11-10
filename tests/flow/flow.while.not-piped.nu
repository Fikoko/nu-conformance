# id: flow.while.not-piped
# rule: flow.while.statement
# expect: parse-error
# error: nu::parser::unexpected_keyword
while false { 1 } | describe
