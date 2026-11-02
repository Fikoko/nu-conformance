# id: aliases.expansion.keyword-alias-of-alias-def
# rule: aliases.expansion.keywords
# expect: parse-error
# error: nu::parser::cant_alias_keyword
alias q = alias r = echo r
