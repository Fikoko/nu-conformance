# id: commands.closure.before-let
# rule: commands.closure.checking
# expect: parse-error
# error: nu::parser::variable_not_found
do $f
let f = {|| 1 }
