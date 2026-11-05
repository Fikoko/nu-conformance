# id: parsing.lenient.trailing-pipe-end-of-file
# rule: parsing.lenient.trailing-pipe
# expect: parse-error
# error: nu::parser::unexpected_eof
[1 2 3] | length |