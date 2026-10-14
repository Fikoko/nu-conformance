# id: operators.compare.duration-filesize
# rule: operators.compare.incompatible
# expect: parse-error
# error: nu::parser::operator_incompatible_types
1sec < 1kB
