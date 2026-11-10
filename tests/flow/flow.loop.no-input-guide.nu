# id: flow.loop.no-input-guide
# rule: flow.loop.statement
# expect: parse-error
# error: nu::parser::unexpected_keyword
1 | loop { break }
