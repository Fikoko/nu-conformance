# id: operators.assign.no-pow-assign
# rule: operators.assign.compound
# expect: parse-error
# error: nu::parser::parse_mismatch
mut x = 1
$x **= 2
