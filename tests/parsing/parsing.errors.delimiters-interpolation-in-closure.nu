# id: parsing.errors.delimiters-interpolation-in-closure
# rule: parsing.errors.delimiters
# expect: parse-error
# error: nu::parser::unclosed_delimiter
do {|x| $"($x" }
