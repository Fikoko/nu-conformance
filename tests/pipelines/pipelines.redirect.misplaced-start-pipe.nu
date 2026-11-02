# id: pipelines.redirect.misplaced-start-pipe
# rule: pipelines.redirect.misplaced
# expect: parse-error
# error: nu::parser::unexpected_redirection
e>| str length
