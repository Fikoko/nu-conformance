# id: flow.loop.not-piped-guide
# rule: flow.loop.statement
# expect: parse-error
# error: nu::parser::unexpected_keyword
# status: pending
mut n = 0
loop { $n += 1; if $n > 2 { break }; $"value ($n)" } | describe
