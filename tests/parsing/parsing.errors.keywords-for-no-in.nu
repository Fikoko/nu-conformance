# id: parsing.errors.keywords-for-no-in
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::expected_keyword
for x [1] { }
