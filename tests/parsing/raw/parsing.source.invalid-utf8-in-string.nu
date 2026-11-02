# id: parsing.source.invalid-utf8-in-string
# rule: parsing.source.utf8
# expect: parse-error
# error: nu::parser::non_utf8
"aÿb"
