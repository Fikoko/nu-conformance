# id: scope.block.do-not-visible-after
# rule: scope.block.local
# expect: parse-error
# error: nu::parser::variable_not_found
do { let a = 1 }
$a
