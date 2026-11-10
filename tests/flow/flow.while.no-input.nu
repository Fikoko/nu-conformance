# id: flow.while.no-input
# rule: flow.while.statement
# expect: parse-error
# error: nu::parser::unexpected_keyword
1 | while true { break }
