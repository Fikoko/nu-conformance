# id: operators.concat.string-int
# rule: operators.concat
# expect: parse-error
# error: nu::parser::operator_unsupported_type
"a" ++ 1
