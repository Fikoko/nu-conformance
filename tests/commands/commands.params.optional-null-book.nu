# id: commands.params.optional-null-book
# rule: commands.params.optional
# expect: output
# ---
# Hello! I don't know your name!
# ---
def greet [name?: string] {
  match $name {
    null => "Hello! I don't know your name!"
    _ => $"Hello, ($name)!"
  }
}
greet
