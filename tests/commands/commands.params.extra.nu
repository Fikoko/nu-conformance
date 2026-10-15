# id: commands.params.extra
# rule: commands.params.required
# expect: parse-error
# error: nu::parser::extra_positional
def greet [name1, name2] { 1 }
greet a b c
