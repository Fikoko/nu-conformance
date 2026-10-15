# id: commands.def.result-type-book
# rule: commands.def.result
# expect: output
# ---
# string
# ---
def greet [name] { $"Hello, ($name)!" }
greet "World" | describe
