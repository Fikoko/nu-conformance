# id: operators.spread.list-book
# rule: operators.spread.list
# expect: output
# ---
# [Spot, Teddy, Tommy, Polly, "Mr. Humphrey Montgomery (cat)", "Kitten (cat)", Porky, Bessie, "...Nemo"]
# ---
let dogs = [Spot, Teddy, Tommy]
let cats = ["Mr. Humphrey Montgomery", Kitten]
[
  ...$dogs
  Polly
  ...($cats | each { |elt| $"($elt) \(cat\)" })
  ...[Porky Bessie]
  ...Nemo
] | to nuon
