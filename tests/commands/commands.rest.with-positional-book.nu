# id: commands.rest.with-positional-book
# rule: commands.rest.collect
# expect: output
# ---
# Hello, Priya!
# Hello, Arjun!
# Hello, Anjali!
# Hello, Vikram!
# And a special welcome to our VIP today, Rahul!
# ---
def vip-greet [vip: string, ...names: string] {
  for $name in $names {
    print $"Hello, ($name)!"
  }

  print $"And a special welcome to our VIP today, ($vip)!"
}
vip-greet Rahul Priya Arjun Anjali Vikram
