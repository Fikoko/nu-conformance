# id: commands.attr.category-book
# rule: commands.attr.category
# expect: output
# ---
# deprecated
# ---
null
@category "deprecated"
def greet [name: string] { $"Hello, ($name)!" }
scope commands | where name == greet | get 0.category
