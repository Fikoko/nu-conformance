# id: parsing.source.invalid-utf8-in-code
# rule: parsing.source.utf8
# expect: parse-error
# error: nu::parser::non_utf8
echo ÿ
