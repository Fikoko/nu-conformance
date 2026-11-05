# id: parsing.errors.definition-extra-redirect
# rule: parsing.errors.definition-extra
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [] { } o> o> x
