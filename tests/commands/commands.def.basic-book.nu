# id: commands.def.basic-book
# rule: commands.def.basic
# expect: output
# ---
# Hello, World!
# ---
def greet [name] {
  $"Hello, ($name)!"
}
greet "World"
