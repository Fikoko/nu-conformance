# id: parsing.lenient.range-head-huge-int
# rule: types.int.too-large
# expect: parse-error
# error: nu::parser::error
99999999999999999999..a
