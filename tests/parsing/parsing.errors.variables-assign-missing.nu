# id: parsing.errors.variables-assign-missing
# rule: parsing.errors.variables
# expect: parse-error
# error: nu::parser::variable_not_found
$bad.x = 1
