# id: commands.params.default-book
# rule: commands.params.default
# expect: output
# ---
# ["Hello, Nushell!", "Hello, world!"]
# ---
def greet [name = "Nushell"] {
  $"Hello, ($name)!"
}
[(greet) (greet world)] | to nuon
