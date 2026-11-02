# id: parsing.errors.match-no-pattern
# rule: parsing.errors.match
# expect: parse-error
# error: nu::parser::type_mismatch
match 1 { => 1 }
