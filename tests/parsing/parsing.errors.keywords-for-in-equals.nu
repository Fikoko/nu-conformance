# id: parsing.errors.keywords-for-in-equals
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::parse_mismatch_with_full_string_msg
for x in = [1] {}
