# id: modules.use.position-not-piped
# rule: modules.use.position
# expect: parse-error
# error: nu::parser::unexpected_keyword
module m { export def f [] { 'f' } }
use m f | f
