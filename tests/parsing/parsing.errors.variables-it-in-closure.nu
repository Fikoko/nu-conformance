# id: parsing.errors.variables-it-in-closure
# rule: parsing.errors.variables
# expect: runtime-error
# error: nu::shell::variable_not_found
[1 2 3] | where {|x| $it > 1} | to nuon
