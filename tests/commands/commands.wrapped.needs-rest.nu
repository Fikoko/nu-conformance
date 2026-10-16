# id: commands.wrapped.needs-rest
# rule: commands.wrapped.rest
# expect: parse-error
# error: nu::parser::missing_positional
def --wrapped w [a] { $a }
