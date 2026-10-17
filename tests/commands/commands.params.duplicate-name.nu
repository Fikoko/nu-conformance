# id: commands.params.duplicate-name
# rule: commands.params.duplicates
# expect: parse-error
# error: nu::parser::duplicate_parameter
# status: pending
def f [a, a] { $a }
f 1 2
