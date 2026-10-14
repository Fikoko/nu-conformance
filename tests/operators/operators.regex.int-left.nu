# id: operators.regex.int-left
# rule: operators.regex.types
# expect: parse-error
# error: nu::parser::operator_unsupported_type
1 =~ "1"
