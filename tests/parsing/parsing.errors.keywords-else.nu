# id: parsing.errors.keywords-else
# rule: parsing.errors.keywords
# expect: parse-error
# error: nu::parser::keyword_missing_arg
if true { 1 } else
