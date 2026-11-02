# id: parsing.errors.match-no-result
# rule: parsing.errors.match
# expect: parse-error
# error: nu::parser::type_mismatch
match 1 { 1 => }
