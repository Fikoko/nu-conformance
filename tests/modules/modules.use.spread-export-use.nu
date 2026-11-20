# id: modules.use.spread-export-use
# rule: modules.use.spread
# expect: parse-error
# error: nu::parser::wrong_import_pattern
# status: pending
module m { export def f [] { 'f' } }
const l = [f]
module n { export use m ...$l }
