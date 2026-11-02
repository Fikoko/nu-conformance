# id: pipelines.redirect.target-missing-pipe
# rule: pipelines.redirect.target
# expect: parse-error
# error: nu::parser::parse_mismatch
echo a o> | str length
