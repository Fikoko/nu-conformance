# id: commands.rest.spread-book
# rule: commands.rest.collect
# expect: output
# ---
# Hello, Dwayne!
# Hello, Shanice!
# Hello, Jerome!
# And a special welcome to our VIP today, Tanisha!
# ---
def vip-greet [vip: string, ...names: string] {
  for $name in $names {
    print $"Hello, ($name)!"
  }

  print $"And a special welcome to our VIP today, ($vip)!"
}
let vip = "Tanisha"
let guests = [ Dwayne, Shanice, Jerome ]
vip-greet $vip ...$guests
