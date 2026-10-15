# id: flow.loop.value-is-nothing-guide
# rule: flow.loop.statement
# expect: output
# ---
# nothing
# ---
mut n = 0
loop { $n += 1; if $n > 2 { break }; $"value ($n)" } | describe
