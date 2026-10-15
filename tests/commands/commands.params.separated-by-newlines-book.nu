# id: commands.params.separated-by-newlines-book
# rule: commands.params.separators
# expect: output
# ---
# Hello, Wei and Mei!
# ---
def greet [
  name1
  name2
] {
  $"Hello, ($name1) and ($name2)!"
}
greet Wei Mei
