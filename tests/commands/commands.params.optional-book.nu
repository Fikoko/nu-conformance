# id: commands.params.optional-book
# rule: commands.params.optional
# expect: output
# ---
# Hello, You
# ---
def greet [name?: string] {
  $"Hello, ($name | default 'You')"
}
greet
