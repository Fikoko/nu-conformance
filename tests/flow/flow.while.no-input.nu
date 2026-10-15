# id: flow.while.no-input
# rule: flow.while.statement
# expect: parse-error
# error: nu::parser::input_type_mismatch
1 | while true { break }
