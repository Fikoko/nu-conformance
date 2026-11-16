# id: commands.params.default-once-positional
# rule: commands.params.default-once
# expect: parse-error
# error: nu::parser::error
# status: pending
def cmd [a = 1 = 2] { $a }
cmd
