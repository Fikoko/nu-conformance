# id: modules.use.names-unknown
# rule: modules.use.names
# expect: parse-error
# error: nu::parser::export_not_found
module m { export def f [] { 'f' } }
use m g
