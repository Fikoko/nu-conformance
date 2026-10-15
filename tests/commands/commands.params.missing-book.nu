# id: commands.params.missing-book
# rule: commands.params.required
# expect: parse-error
# error: nu::parser::missing_positional
def greet [name1, name2] {
  $"Hello, ($name1) and ($name2)!"
}
greet Wei
