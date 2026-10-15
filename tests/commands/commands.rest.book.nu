# id: commands.rest.book
# rule: commands.rest.collect
# expect: output
# ---
# Hello, Elin!
# Hello, Lars!
# Hello, Erik!
# ---
def multi-greet [...names: string] {
  for $name in $names {
    print $"Hello, ($name)!"
  }
}

multi-greet Elin Lars Erik
