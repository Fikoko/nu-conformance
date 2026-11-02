# id: parsing.errors.keywords-signature-no-arrow
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [x]: int { 1 }
