# id: parsing.lenient.range-huge-int
# rule: types.int.too-large
# expect: parse-error
# error: nu::parser::error
let r = 99999999999999999999..1
$r | describe
