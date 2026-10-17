# id: commands.params.positional-after-rest
# rule: commands.params.after-rest
# expect: parse-error
# error: nu::parser::positional_after_rest
# status: pending
def f [...r, a] { {r: $r, a: $a} }
f 1 2 3 | to nuon
