# id: operators.assign.needs-spaces
# rule: operators.assign.basic
# expect: parse-error
# error: nu::parser::parse_mismatch_with_did_you_mean
mut x = 1
$x=2
