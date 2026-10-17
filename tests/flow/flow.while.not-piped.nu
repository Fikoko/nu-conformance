# id: flow.while.not-piped
# rule: flow.while.statement
# expect: parse-error
# error: nu::parser::unexpected_keyword
# status: pending
while false { 1 } | describe
