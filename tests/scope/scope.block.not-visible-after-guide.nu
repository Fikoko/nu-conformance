# id: scope.block.not-visible-after-guide
# rule: scope.block.local
# expect: parse-error
# error: nu::parser::variable_not_found
if true { let inner = 1 }; $inner
