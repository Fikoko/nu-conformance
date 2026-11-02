# id: aliases.expansion.keyword-with-args
# rule: aliases.expansion.keywords
# expect: parse-error
# error: nu::parser::cant_alias_keyword
alias x = let y = 1
