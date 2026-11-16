# id: commands.params.default-once-closure
# rule: commands.params.default-once
# expect: parse-error
# error: nu::parser::error
# status: pending
do {|a = 1 = 2| $a }
