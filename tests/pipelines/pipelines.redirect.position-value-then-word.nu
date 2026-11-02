# id: pipelines.redirect.position-value-then-word
# rule: pipelines.redirect.position
# expect: parse-error
# error: nu::parser::parse_mismatch
"a" o> f.txt b
