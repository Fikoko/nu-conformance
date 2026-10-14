# id: operators.affix.int
# rule: operators.affix.match
# expect: parse-error
# error: nu::parser::operator_unsupported_type
"abc" starts-with 1
