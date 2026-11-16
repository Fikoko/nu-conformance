# id: commands.params.default-once-no-parameter
# rule: commands.params.default-once
# expect: parse-error
# error: nu::parser::parse_mismatch
# status: pending
def cmd [= 1] { 1 }
