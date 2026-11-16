# id: commands.params.default-once-type-after
# rule: commands.params.default-once
# expect: parse-error
# error: nu::parser::parse_mismatch
# status: pending
def cmd [a = "x" : int] { $a }
cmd
