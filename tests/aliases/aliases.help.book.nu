# id: aliases.help.book
# rule: aliases.help
# expect: output
# ---
# Alias for `greet`
# ---
null
# Say hello to someone
def greet [name: string] { $"Hello, ($name)!" }
alias hi = greet
help hi | lines | first
