# id: parsing.errors.first-unclosed-wins
# rule: parsing.errors.first
# expect: parse-error
# error: nu::parser::unclosed_delimiter
print ran
let x = 1 +
let y = (2
