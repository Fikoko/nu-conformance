# id: parsing.intro.nothing-runs
# rule: parsing.intro
# expect: parse-error
# error: nu::parser::unclosed_delimiter
'x' | save ran.txt
let y = (2
