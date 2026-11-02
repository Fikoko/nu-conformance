# id: parsing.source.latin1-word
# rule: parsing.source.utf8
# expect: parse-error
# error: nu::parser::non_utf8
echo café
