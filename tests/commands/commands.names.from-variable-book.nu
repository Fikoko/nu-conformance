# id: commands.names.from-variable-book
# rule: commands.names.static
# expect: parse-error
# error: nu::parser::unknown_state
let name = "foo"
def $name [] { foo }
