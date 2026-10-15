# id: flow.try.catch-needs-closure
# rule: flow.try.syntax
# expect: parse-error
# error: nu::parser::parse_mismatch_with_full_string_msg
try { 1 / 0 } catch 0
