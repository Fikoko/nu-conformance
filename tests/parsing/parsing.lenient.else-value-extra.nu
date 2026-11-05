# id: parsing.lenient.else-value-extra
# rule: parsing.lenient.else-value
# expect: parse-error
# error: nu::parser::extra_positional
let x = 1
if false { 'a' } else $x $x
