# id: operators.arith.string-plus-int
# rule: operators.arith.types
# expect: parse-error
# error: nu::parser::operator_incompatible_types
"a" + 1
