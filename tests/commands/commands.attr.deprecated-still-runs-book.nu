# id: commands.attr.deprecated-still-runs-book
# rule: commands.attr.deprecated
# expect: output
# ---
# Hello, bob!
# ---
null
@deprecated
def greet [name: string] { $"Hello, ($name)!" }
greet "bob"
