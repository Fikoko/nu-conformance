# id: commands.params.default-once-flag
# rule: commands.params.default-once
# expect: parse-error
# error: nu::parser::error
# status: pending
def cmd [--f = 1 = 2] { $f }
cmd
