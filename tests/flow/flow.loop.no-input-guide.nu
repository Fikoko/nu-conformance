# id: flow.loop.no-input-guide
# rule: flow.loop.statement
# expect: parse-error
# error: nu::parser::input_type_mismatch
1 | loop { break }
