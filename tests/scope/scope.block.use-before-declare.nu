# id: scope.block.use-before-declare
# rule: scope.block.order
# expect: parse-error
# error: nu::parser::variable_not_found
$later
let later = 1
