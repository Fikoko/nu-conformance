# id: pipelines.redirect.misplaced-after-pipe
# rule: pipelines.redirect.misplaced
# expect: parse-error
# error: nu::parser::unexpected_redirection
echo a | e>| str length
