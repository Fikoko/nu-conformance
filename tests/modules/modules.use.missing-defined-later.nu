# id: modules.use.missing-defined-later
# rule: modules.use.missing
# expect: parse-error
# error: nu::parser::module_not_found
use m f
module m { export def f [] { 'f' } }
