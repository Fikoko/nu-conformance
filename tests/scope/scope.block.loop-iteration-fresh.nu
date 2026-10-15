# id: scope.block.loop-iteration-fresh
# rule: scope.block.order
# expect: parse-error
# error: nu::parser::variable_not_found
for i in [1 2] { if $i == 2 { $seen }; let seen = $i }
