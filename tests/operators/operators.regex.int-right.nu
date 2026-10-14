# id: operators.regex.int-right
# rule: operators.regex.types
# expect: parse-error
# error: nu::parser::operator_unsupported_type
"abc" =~ 1
