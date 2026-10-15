# id: commands.params.unknown-type
# rule: commands.params.types
# expect: parse-error
# error: nu::parser::unknown_type
def f [x: foo] { 1 }
