# id: operators.concat.records
# rule: operators.concat
# expect: parse-error
# error: nu::parser::operator_unsupported_type
{a: 1} ++ {b: 2}
