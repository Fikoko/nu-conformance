# id: modules.overlay.position-not-piped
# rule: modules.overlay.position
# expect: parse-error
# error: nu::parser::unexpected_keyword
module m { export def f [] { 'f' } }
overlay use m | f
