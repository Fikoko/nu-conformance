# id: parsing.errors.keywords-signature-arrow
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::missing_type
def f [x]: int -> { 1 }
